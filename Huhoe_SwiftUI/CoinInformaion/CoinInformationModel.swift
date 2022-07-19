//
//  CoinInformationModel.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import Foundation

struct CoinInformationModel: Hashable {
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
