//
//  Note.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import Foundation

struct Note: Equatable {
    var id: String? = UUID().uuidString
    var name: String
    var image: String
}
