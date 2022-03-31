//
//  Localizable.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 31/03/22.
//

import Foundation


public struct Localizable {
    
    // All strings, will be localizaed in two languages:
    //
    // 🇺🇸 EN (English language) as base language
    // 🇮🇹 ITA (Italian language)
    //
    
    /// Home -> `Welcome to EasyNote`
    public static let homeTitle = "LOC_HOME_TITLE".localizeMe()
    
    /// Home Login Button -> `Login`
    public static let homeLogin = "LOC_HOME_LOGIN".localizeMe()
    
    /// Home Register Button -> `Login`
    public static let homeRegister = "LOC_HOME_REGISTER".localizeMe()
    
    /// Login Page Title -> `Login`
    public static let loginAuthLoginTitle = "LOC_AUTH_LOGIN_TITLE".localizeMe()
    
    /// Register Page Title -> `Register`
    public static let loginAuthRegisterTitle = "LOC_AUTH_REGISTER_TITLE".localizeMe()
    
    
}

extension String {
    func localizeMe() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
