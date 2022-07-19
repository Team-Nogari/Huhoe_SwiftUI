//
//  APIRouter.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/18.
//

import Foundation

enum APIRouter {
    
    // MARK: - API Cases
    
    case ticker(coinSymbol: String)
    case transactionHistory(coinSymbol: String)
    case candlestick(coinSymbol: String)
    
    // MARK: - Base URL
    
    var baseURL: URL {
        return URL(string: "https://api.bithumb.com/public")!
    }
    
    // MARK: - Methods
    
    enum HTTPMethod: CustomStringConvertible {
        case get
        
        var description: String {
            switch self {
            case .get:
                return "GET"
            }
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .ticker, .transactionHistory, .candlestick:
            return .get
        }
    }
    
    // MARK: - Paths
    
    var path: String {
        switch self {
        case .ticker(let coinSymbol):
            return "/ticker/\(coinSymbol)_KRW"
        case .transactionHistory(let coinSymbol):
            return "/transaction_history/\(coinSymbol)_KRW"
        case .candlestick(let coinSymbol):
            return "/candlestick/\(coinSymbol)_KRW"
        }
    }
    
    // MARK: - asURLRequset
    
    func asURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequset = URLRequest(url: url)
        urlRequset.httpMethod = "\(method)"
        
        return urlRequset
    }
}
