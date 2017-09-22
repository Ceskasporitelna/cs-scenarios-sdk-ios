//
//  Account.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 21.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

/// Account info
struct Account: JSONSerializable {
    
    /// Name
    var name: String
    
    /// JSON representation of the structure
    ///
    /// - Returns: A dictionary with the Values data that can be serialized
    func JSONRepresentation() -> [String : Any] {
        return ["name": self.name]
    }
}
