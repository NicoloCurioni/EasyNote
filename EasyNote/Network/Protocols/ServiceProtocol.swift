//
//  ServiceProtocol.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 01/04/22.
//

import Foundation

public typealias Headers = [String: String]

public protocol ServiceProtocol {
    /// The Model associated for the response.
    associatedtype ResponseModel: Decodable

    /// The base url of the request.
    var baseURL: URL { get }
    
    /// The Path of the request.
    var path: [String] { get }
    
    var queryItems: Parameters? { get }
    
    /// The kind of the request.
    var method: HTTPMethod { get }
    
    /// The request parameters type.
    var task: Task { get }
    
    /// The headers of the request.
    var headers: Headers? { get }
    
    /// The kind of encoding for parameters.
    var parametersEncoding: ParametersEncoding { get }
    
    /// Parameters of the request.
    var parameters: Parameters? { get }

    /// Direct httpBody of the request.
    var jsonData: ServiceData? { get }
    
    /// The decoder to use when decoding response data.
    var dataDecoder: JSONDecoder { get }
    
    /// The encoder to use when encoding data to json.
    var dataEncoder: JSONEncoder { get }

    /// The purpose of the environment.
    var environmentPurpose: EnvironmentPurpose { get }
}

public extension ServiceProtocol {
    private var baseURL: URL {
        URL(string: "")!
    }
    
    private var headers: Headers? {
        [:]
    }
    
    var queryItems: Parameters? {
        nil
    }
    
    var parameters: Parameters? {
        [:]
    }

    var jsonData: ServiceData? {
        nil
    }
    
    var task: Task {
        if
            let params = parameters,
            params.count > 0,
            let data = try? JSONSerialization.data(withJSONObject: params,
                                                   options: []) {
            return .requestJSON(data)
        } else if let jsonData = jsonData {
            return .requestJSON(jsonData)
        } else {
            return .requestPlain
        }
    }
    
    var parametersEncoding: ParametersEncoding {
        method.parametersEncoding
    }

    var dataDecoder: JSONDecoder {
        JSONDecoder()
    }
    
    var dataEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }

    var environmentPurpose: EnvironmentPurpose {
        return .standard
    }
}
