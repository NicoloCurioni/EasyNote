//
//  Task.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 01/04/22.
//

import Foundation

public typealias Parameters = [String : Any]
public typealias ServiceData = Data

public enum Task {
    case requestPlain
    case requestJSON(ServiceData)
    case requestImage(ServiceData)
}
