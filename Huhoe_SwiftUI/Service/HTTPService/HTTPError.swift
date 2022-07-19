//
//  HTTPError.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import Foundation

enum HTTPError: LocalizedError {
    case abnormalStatusCode(_ statusCode: Int)
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .abnormalStatusCode(let statusCode):
            return "ERROR: Abnormal Status Code \(statusCode)"
        case .unknownError:
            return "ERROR: Unknown Error"
        }
    }
}
