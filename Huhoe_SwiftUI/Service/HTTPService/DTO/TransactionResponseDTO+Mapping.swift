//
//  TransactionResponseDTO+Mapping.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import Foundation

struct TransactionResponseDTO: Decodable {
    let status: String
    let transactionDTO: [TransactionDTO]
    
    enum CodingKeys: String, CodingKey {
        case status
        case transactionDTO = "data"
    }
}

extension TransactionResponseDTO {
    struct TransactionDTO: Decodable {
        let transactionDate: String
        let type: TradeType
        let unitsTraded: String
        let price: String
        let total: String
    }
}

extension TransactionResponseDTO {
    enum TradeType: String, Decodable {
        case bid = "bid"
        case ask = "ask"
    }
}
