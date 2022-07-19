//
//  HTTPService.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/18.
//

import Foundation
import Combine

final class HTTPService {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request(_ router: APIRouter) -> AnyPublisher<Data, HTTPError> {
        return session.dataTaskPublisher(for: router.asURLRequest())
            .tryMap() { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw HTTPError.unknownError
                }
                
                guard 200..<300 ~= httpResponse.statusCode else {
                    throw HTTPError.abnormalStatusCode(httpResponse.statusCode)
                }
                
                guard data.isEmpty == false else {
                    throw HTTPError.unknownError
                }
                
                return data
            }
            .mapError { error in
                if let error = error as? HTTPError {
                    return error
                } else {
                    return HTTPError.unknownError
                }
            }
            .eraseToAnyPublisher()
    }
}
