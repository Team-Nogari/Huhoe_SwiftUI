//
//  APIRouter.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/18.
//

import Foundation

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    // MARK: - API Cases
    
    case ticker(coinSymbol: String)
    case transactionHistory(coinSymbol: String)
    case candlestick(coinSymbol: String)
    
    // MARK: - Base URL
    
    var baseURL: URL {
        return URL(string: "https://api.bithumb.com/public")!
    }
    
    // MARK: - Methods
    
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
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        let urlRequset = try URLRequest(url: url, method: method)
        
        return urlRequset
    }
}
