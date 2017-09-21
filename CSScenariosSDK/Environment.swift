//
//  Environment.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 20.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

fileprivate let environmentProduction = "https://www.csas.cz/webapi"
fileprivate let environmentSystemTest = "http://www.csast.csas.cz/webapi"

enum Environment {
    
    case production
    case systemTest
    case other(value: String)

    var value: String {
        switch self {
        case .production:
            return environmentProduction
        case .systemTest:
            return environmentSystemTest
        case .other(let value):
            return value
        }
    }
}
