//
//  networkingProvider.swift
//  easyShopper
//
//  Created by Oscar Navidad on 9/3/22.
//
import Foundation
import Moya

extension MoyaProvider {
    enum ProviderType {
        case normal
    }

    static func networkingProvider(type: ProviderType = .normal) -> MoyaProvider<MultiTarget> {
        //let authorizationPlugin = AuthorizablePlugin().plugin
        let loggerPlugin = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))

        switch type {
        case .normal:
            return MoyaProvider<MultiTarget>(plugins: [loggerPlugin])
        }
    }
}
