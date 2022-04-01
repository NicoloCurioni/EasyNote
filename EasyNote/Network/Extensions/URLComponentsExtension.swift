//
//  URLComponentsExtension.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 01/04/22.
//

import Foundation

extension URLComponents {
    
    init<T: ServiceProtocol>(service: T) {
        let url = service.path.reduce(service.baseURL) { newURL, nextPath -> URL in
            newURL.appendingPathComponent(nextPath)
        }
        self.init(url: url, resolvingAgainstBaseURL: false)!
        guard let items = service.queryItems, !items.isEmpty else { return }
        queryItems = service.queryItems?.map { key, value in
            URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
