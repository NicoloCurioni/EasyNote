//
//  APIContainer.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 01/04/22.
//

import Foundation
import Siesta
import SystemConfiguration.CaptiveNetwork

var apiContainer = APIContainer(environment: appEnvironment)

enum APINames {
    case notesAPI
    case userAPI
}

class APIContainer: NSObject {
    
    var userAPI: UserAPI! {
        get { return self.APIs[.userAPI] as? UserAPI }
    }
    
    private var APIs = [APINames : BaseAPI]()
    
    init(environment: Environment) {
        super.init()
    }
}
