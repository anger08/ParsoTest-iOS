//
//  ProfileEndpoint.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//

import Foundation
import Alamofire

enum ProfileEndpoint {
    case getProfile
}

extension ProfileEndpoint: IEndpoint {
    var header: HTTPHeaders? {
        switch self {
        case .getProfile:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getProfile :
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getProfile :
            return "results=10"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getProfile:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
