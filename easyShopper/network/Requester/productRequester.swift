//
//  productRequester.swift
//  easyShopper
//
//  Created by Oscar Navidad on 10/3/22.
//

import Foundation
import Moya

enum ProductsRequest {
    case getProducts
}

extension ProductsRequest: NetworkingRequestType {
    var path: String {
        switch self {
            case .getProducts:
                return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProducts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getProducts:
            return .requestPlain
        }
    }
}
