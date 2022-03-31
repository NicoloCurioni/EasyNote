//
//  ColorAssets.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 30/03/22.
//

import UIKit

extension UIColor {
    
    public static var easyNote: EasyNote.Type {
        return EasyNote.self
    }
    
    // MARK: - Common colors
    public struct EasyNote {
        
        // MARK: - Global Background -
        
        public static let appBackground: UIColor = UIColor(named: "AppBackground")!
        
        // MARK: - Button -
        
        public static let blueCalmApp: UIColor = UIColor(named: "BlueButton")!
        
        public static let blueCalmAppDisabled: UIColor = UIColor(named: "BlueButtonDisabled")!
        
        public static let backgroundBlue: UIColor = UIColor(named: "BlueBackground")!
    }
}
