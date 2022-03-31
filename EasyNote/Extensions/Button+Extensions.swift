//
//  Button+Extensions.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 31/03/22.
//

import UIKit

extension GenericButton {
    
    /// Set button title
    func setButtonTitle(_ title: String) {
        self.setTitle(title, for: .normal)
    }
    
    /// Set button color
    func setupBackgroundColor(_ color: UIColor = UIColor.easyNote.blueCalmApp) {
        self.buttonBackgroundColor = color
    }
}
