//
//  BaseAPI.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 01/04/22.
//

import Foundation
import ObjectMapper
import Siesta
import SwiftyJSON

// MARK: - BaseAPI

class BaseAPI {
    // MARK: - Lifecycle
    
    init(service: Service) {
        self.service = service
    }
    
    // MARK: - Internal
    
    enum resources: String {
        case userSignUp = "auth/v1/signup"
        case userLoginWithEmailAndPassword = "auth/v1/token?grant_type=password"
        case userLoginWithMagicLink = "auth/v1/magiclink"
        //case userSignUpWithPhoneAndPassword = "auth/v1/signup"
        case userLoginViaSMSOTP = "auth/v1/otp"
        case userVerifySMSOTP = "auth/v1/verify"
        
        // GET user data
        case userGetData = "auth/v1/user"
        
        // Forgot Password Email
        case userForgotPasswordEmail = "auth/v1/recover"
        
        // Update user
//        case userUpdate = "auth/v1/user"
        
        // Logout user
        case userLogout = "auth/v1/logout"
        
        // Send a user an invite over email
        case sendUserInviteViaEmail = "auth/v1/invite"
    }
    
    internal var service = Service(baseURL: "")
    
    func getJSONData(_ response: Entity<Any>) -> JSON? {
        return response.json["data"] as JSON
    }
}
