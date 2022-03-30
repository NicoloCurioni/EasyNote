//
//  TextView+Extensions.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 30/03/22.
//

import Foundation
import UIKit

extension AddNoteController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
        
        if textView.text != "" {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}
