//
//  Account.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 21.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

struct Account: JSONSerializable {
    var name: String
    
    func JSONRepresentation() -> [String : Any] {
        return ["name": self.name]
    }
}
