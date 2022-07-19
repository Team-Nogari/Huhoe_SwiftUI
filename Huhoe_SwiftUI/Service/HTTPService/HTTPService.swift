//
//  HTTPService.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/18.
//

import Foundation
import Combine

import Alamofire

final class HTTPService {
    
    func request<T: Decodable>(
        _ object: T.Type,
        _ router: URLRequestConvertible,
        _ decoder: JSONDecoder = JSONDecoder()
    ) -> AnyPublisher<Result<T, AFError>, Never> {
        return AF.request(router)
            .publishDecodable(type: T.self, decoder: decoder)
            .result()
    }
}
