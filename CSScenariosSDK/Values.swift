//
//  Values.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

/// Additional event information, JSON object or value without fixed structure.
struct Values: JSONSerializable {
    
    /// URI value
    var uri: String?
    
    /// Accounts array
    var accounts: [Account]?
    
    /// JSON representation of the structure
    ///
    /// - Returns: A dictionary with the Values data that can be serialized
    func JSONRepresentation() -> [String : Any] {
        var json:[String:Any] = [:]
        json["uri"] = self.uri
        if let theAccounts = accounts {
            let jsonAccounts = theAccounts.map({ $0.JSONRepresentation() })
            json["accounts"] = jsonAccounts
        }
        return json
    }
}
