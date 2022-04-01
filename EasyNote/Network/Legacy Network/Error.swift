//
//  Error.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 01/04/22.
//

import Foundation

// MARK: - EasyNoteErrorHandler

protocol EasyNoteErrorHandler: Error {
    static func getDefaultError() -> Self
    static func getError(from json: [String:Any]) -> Self
}
