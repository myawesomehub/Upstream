//
//  Model.swift
//  
//
//  Created by Mohammad Yasir on 01/05/22.
//

import UIKit

extension Upstream {
    struct iTuneResponseModel: Codable {
        var results: [ResultArray]
    }
    
    struct ResultArray: Codable {
        var version: String
    }
}
