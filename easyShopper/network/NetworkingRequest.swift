//
//  NetworkingRequest.swift
//  easyShopper
//
//  Created by Oscar Navidad on 8/3/22.
//
import Foundation
import Moya

protocol NetworkingRequestType: TargetType { }

extension NetworkingRequestType {
    var baseURL: URL {
        URL(string: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba")!
    }

    var authorizationType: AuthorizationType? {
        .custom("")
    }

    var headers: [String : String]? {
        [:]
    }

    var validationType: ValidationType {
        .successCodes
    }

    var sampleData: Data {
        Data()
    }
    
}
