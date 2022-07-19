//
//  CoinInformationModel.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import Foundation

struct CoinInformationModel: Equatable {
    let coinName: String
    let coinSymbol: String
    let calculatedPrice: Double
    let rate: Double
    let profitAndLoss: Double
    let currentPrice: Double
    let oldPrice: Double
}

extension CoinInformationModel {
    var calculatedPriceString: String {
        return self.calculatedPrice.toString()
    }
    
    var rateString: String {
        return self.rate.toString(digit: 2)
    }
    
    var profitAndLossString: String {
        return profitAndLoss.toString()
    }
    
    var currentPriceString: String {
        return currentPrice.toString(digit: 4)
    }
    
    var oldPriceString: String {
        return oldPrice.toString(digit: 4)
    }
}

extension CoinInformationModel: Identifiable {
    var id: String { coinSymbol }
}

extension CoinInformationModel {
    static var dummy: CoinInformationModel {
        return CoinInformationModel(
            coinName: "비트코인",
            coinSymbol: "BTC",
            calculatedPrice: 20000000,
            rate: 10,
            profitAndLoss: -2000000,
            currentPrice: 22000000,
            oldPrice: 20000000
        )
    }
}
