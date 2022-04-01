//
//  NetworkError.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 01/04/22.
//

import UIKit

public struct NetworkError: Error {
    public let error: Error?
    public let data: Data?
    
    public init(error: Error?,
                data: Data?) {
        self.error = error
        self.data = data
    }
}

extension NetworkError {
    func easyNoteError<T>() -> T where T: EasyNoteErrorHandler {
        guard
            let data = self.data,
            let jsonDict = try? JSONSerialization.jsonObject(with: data, options: []) as? Parameters
        else {
            return T.getDefaultError()
        }
        
        return T.getError(from: jsonDict)
    }
}
