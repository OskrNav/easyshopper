//
//  NetworkingRequester.swift
//  easyShopper
//
//  Created by Oscar Navidad on 8/3/22.
//

import Foundation
import Moya
import Combine

// MARK: - Utility structs
struct DataResponse {
    let data: Data
    let httpResponse: HTTPURLResponse?
    
}
struct DecodedResponse<T: Decodable> {
    let object: T
    let httpResponse: HTTPURLResponse?
}

// MARK: - Procotols

protocol NetworkingCombineRequesterType {
    func execute(request: NetworkingRequestType) -> AnyPublisher<DataResponse, Error>
    func executeNoBodyRequest(request: NetworkingRequestType)  -> AnyPublisher<HTTPURLResponse?, Error>
}


extension NetworkingCombineRequesterType {

    func execute<T: Decodable>(request: NetworkingRequestType, using decoder: JSONDecoder = .init()) -> AnyPublisher<DecodedResponse<T>, Error> {
        execute(request: request)
            .tryMap { try DecodedResponse(object: decoder.decode(T.self, from: $0.data), httpResponse: $0.httpResponse)  }
            .eraseToAnyPublisher()
            
    }

    func execute(request: NetworkingRequestType) -> AnyPublisher<HTTPURLResponse?, Error> {
        executeNoBodyRequest(request: request)
            .eraseToAnyPublisher()
    }
}

// MARK: - Implementation in Combine
class NetworkingCombineRequester:  NetworkingCombineRequesterType {
    
    let provider: MoyaProvider<MultiTarget>
    
    init(provider: MoyaProvider<MultiTarget> = .networkingProvider()) {
        self.provider = provider
    }
    
    func execute(request: NetworkingRequestType) -> AnyPublisher<DataResponse, Error> {
        Future { [weak self] seal in
            self?.provider.request(MultiTarget(request)) { result in
                switch result {
                case .success(let response):
                    seal(.success(DataResponse(data: response.data, httpResponse: response.response)))
                case .failure(let error):
                    seal(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }

    func executeNoBodyRequest(request: NetworkingRequestType)  -> AnyPublisher<HTTPURLResponse?, Error> {
        Future { [weak self] seal in
            self?.provider.request(MultiTarget(request)) { result in
                switch result {
                case .success(let response):
                    seal(.success(response.response))
                case .failure(let error):
                    seal(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
