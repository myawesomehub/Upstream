//
//  File.swift
//  
//
//  Created by Mohammad Yasir on 01/05/22.
//

import UIKit

extension UIApplication {
    static var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Not Found"
    }
}
