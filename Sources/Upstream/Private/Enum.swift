//
//  File.swift
//  
//
//  Created by Mohammad Yasir on 01/05/22.
//

import UIKit

extension Upstream {
    public enum Status {
        case sameVersion(version: String)
        case notSaveVersion(appstoreVersion: String, localAppVersion: String)
        case failed(Error)
    }
}

extension Upstream {
    enum NetworkError: Error {
        case dataNotFound
        case timeOut
        case wrongURL
    }
}
