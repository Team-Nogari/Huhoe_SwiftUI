//
//  HTTPService.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/18.
//

import Foundation

import Alamofire

final class HTTPService {
    
    typealias onSuccess<T> = ((T) -> Void)
    typealias onFailure = ((_ error: Error) -> Void)
    
    func request<T>(
        _ object: T.Type,
        _ router: URLRequestConvertible,
        success: @escaping onSuccess<T>,
        failure: @escaping onFailure
    ) where T: Decodable {
        AF.request(router)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: object) { response in
                switch response.result {
                case .success:
                    guard let decodedData = response.value else {
                        return
                    }
                    success(decodedData)
                case .failure(let error):
                    failure(error)
                }
            }
    }
}
