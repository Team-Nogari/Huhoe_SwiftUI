//
//  CoinInformationEffects.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import Foundation
import Combine

import ComposableArchitecture

func coinInformaionEffect(decoder: JSONDecoder) -> Effect<[CoinInformationModel], HTTPError> {
  let httpService = HTTPService()
  
  let tickerAllRouter = APIRouter.ticker(coinSymbol: "ALL")
  let tickerPublisher = httpService.request(tickerAllRouter)
    .decode(type: TickerResponseDTO.self, decoder: decoder)
    .map { dto in
      dto.toDomain()
    }
    .map { tickers -> [Ticker] in
      let tickersCount = tickers.count
      let sortedTicker = tickers
        .sorted {
          $0.accTradeValue24Hour > $1.accTradeValue24Hour
        }
        .dropLast(tickersCount - 5)
      
      return Array(sortedTicker)
    }
  
  let symbolsPublisher = tickerPublisher
    .map { tickers -> [String] in
      let symbols = tickers.map {
        $0.coinSymbol
      }
      
      return symbols
    }
  
  // 이중 AnyPublisher<AnyPublisher<[Transaction], HTTPError>> 결과 값이 이딴 식으로 나옴.
  // AnyPublisher<[Transaction], HTTPError> 이렇게 나왔으면 좋겠음
  
  
  let transactionPublisher = symbolsPublisher
    .map { symbols -> AnyPublisher<[Transaction], HTTPError> in
      Publishers.MergeMany(symbols.map(dd)) //AnyPublisher<[Transaction], HTTPError> 이게 아니라
      // [Transaction]으로 만들고 싶다. 제발
        .collect()
        .eraseToAnyPublisher()
    }
  
  func dd(_ s: String) -> AnyPublisher<Transaction, HTTPError> {
    let transactionRouter = APIRouter.transactionHistory(coinSymbol: s)
    return httpService.request(transactionRouter) // 반환값 Publisher
      .decode(type: TransactionResponseDTO.self, decoder: decoder)
      .map { dto in
        dto.toDomain(coinSymbol: s)
      }
      .mapError { error -> HTTPError in
        if let error = error as? HTTPError {
            return error
        } else {
            return HTTPError.unknownError
        }
      }
      .eraseToAnyPublisher()
  }
  
  let priceHistoryPublisher = symbolsPublisher
    .map { symbols -> AnyPublisher<[CoinPriceHistory], HTTPError> in
      Publishers.MergeMany(symbols.map(aa)) //AnyPublisher<[Transaction], HTTPError> 이게 아니라
      // [Transaction]으로 만들고 싶다. 제발
        .collect()
        .eraseToAnyPublisher()
    }

  func aa(_ s: String) -> AnyPublisher<CoinPriceHistory, HTTPError> {
    let coinPriceRouter = APIRouter.candlestick(coinSymbol: s)
    return httpService.request(coinPriceRouter) // 반환값 Publisher
      .compactMap { data -> CandlestickResponseDTO? in
        let datda = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        return CandlestickResponseDTO(serializedData: datda)
      }
      .map {
        $0.toDomain(coinSymbol: s)
      }
      .mapError {
        $0 as HTTPError
      }
      .eraseToAnyPublisher()
  }
  
  return Publishers.Zip3(tickerPublisher, transactionPublisher, priceHistoryPublisher)
    .map { tickers, transaction, priceHistory in
      tickers.map {
        CoinInformationModel(
          coinName: $0.coinSymbol,
          coinSymbol: $0.coinSymbol,
          calculatedPrice: 100,
          rate: 1,
          profitAndLoss: 100,
          currentPrice: 100,
          oldPrice: 100
        )
      }
    }
    .mapError{ _ in
      HTTPError.unknownError
    }
    .eraseToEffect()
  
//  return symbolsPublisher
//    .map { symbols -> [CoinInformationModel] in
//      symbols.map { symbol in
//        CoinInformationModel(
//          coinName: symbol,
//          coinSymbol: symbol,
//          calculatedPrice: 100,
//          rate: 100,
//          profitAndLoss: 100,
//          currentPrice: 100,
//          oldPrice: 100
//        )
//      }
//    }
//    .mapError{ _ in
//      HTTPError.unknownError
//    }
//    .eraseToEffect()
}

func dummyCoinInformaionErrect(decoder: JSONDecoder) -> Effect<[CoinInformationModel], HTTPError> {
  let dummyCoinInformations = [
    CoinInformationModel(
      coinName: "비트코인",
      coinSymbol: "BTC",
      calculatedPrice: 20000000,
      rate: 10,
      profitAndLoss: -2000000,
      currentPrice: 22000000,
      oldPrice: 20000000
    ),
    CoinInformationModel(
      coinName: "이더리움",
      coinSymbol: "ETH",
      calculatedPrice: 20000000,
      rate: 10,
      profitAndLoss: -2000000,
      currentPrice: 22000000,
      oldPrice: 20000000
    ),
    CoinInformationModel(
      coinName: "리플",
      coinSymbol: "XPL",
      calculatedPrice: 20000000,
      rate: 10,
      profitAndLoss: -2000000,
      currentPrice: 22000000,
      oldPrice: 20000000
    )
  ]
  
  return Effect(value: dummyCoinInformations)
}
