//
//  Environment.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 01/04/22.
//

import Foundation

public enum Environment: CaseIterable {
    case test
    case dev
    case pre
    case prod
    case mock

    public var domain: String {
        switch self {
        case .test:
            return "" // Add your Supabase ENDPOINT
        case .dev:
            return ""
        case .pre:
            return ""
        case .prod:
            return ""
        case .mock:
            return ""
        }
    }
}
