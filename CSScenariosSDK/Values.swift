//
//  Values.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

struct Values: JSONSerializable {
    var uri: String?
    var accounts: [Account]?
    
    func JSONRepresentation() -> [String : Any] {
        var json:[String:Any] = ["uri": self.uri ?? ""]
        if let theAccounts = accounts {
            let jsonAccounts = theAccounts.map({ $0.JSONRepresentation() })
            json["accounts"] = jsonAccounts
        }
        return json
    }
}
