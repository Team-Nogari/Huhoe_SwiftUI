//
//  CoinInformationEffects.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import Foundation

import ComposableArchitecture

func coinInformaionEffect(decoder: JSONDecoder) -> Effect<[CoinInformationModel], HTTPError> {
    return Effect(value: [])
}

func dummyRepositoryErrect(decoder: JSONDecoder) -> Effect<[CoinInformationModel], HTTPError> {
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
