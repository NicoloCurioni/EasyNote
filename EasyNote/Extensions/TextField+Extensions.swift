//
//  TextField+Extensions.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 30/03/22.
//

import Foundation
import UIKit

extension AddNoteController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
