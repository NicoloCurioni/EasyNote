//
//  EnvironmentManager.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 01/04/22.
//

import Foundation

public enum EnvironmentManager {
    public static var appEnvironment: Environment {
        #if DEBUG
        return .test
        #else
        return .prod
        #endif
    }
}
