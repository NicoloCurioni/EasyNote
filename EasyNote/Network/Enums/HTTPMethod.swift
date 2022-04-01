//
//  HTTPMethod.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 01/04/22.
//

public enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
    case PATCH = "PATCH"
    
    var parametersEncoding: ParametersEncoding {
        switch self {
        case .POST,
             .PUT,
             .PATCH:
            return .json
            
        case .DELETE,
                .GET:
            return .url
        }
    }
}
