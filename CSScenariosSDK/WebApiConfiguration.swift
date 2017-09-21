//
//  WebApiConfiguration.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 20.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

fileprivate let czLanguage = "cs-CZ"

class WebApiConfiguration: NSObject {

    public let environment: Environment
    public let webApiKey: String
    public var authorizationToken: String
    public var language: String
    
    init(webApiKey: String, environment: Environment, language: String, authorizationToken: String) {
        self.webApiKey = webApiKey
        self.environment = environment
        self.language = language
        self.authorizationToken = authorizationToken
    }
}
