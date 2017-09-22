//
//  Resource.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 20.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

/// An API resource
class Resource: NSObject {
    
    let basePath: String
    let client: NetworkClient
    
    /// Initialize the resource with base path and a network client
    ///
    /// - Parameters:
    ///   - basePath: Base path - a relative URL
    ///   - client: Network client for the communication
    init(basePath: String, client: NetworkClient) {
        self.basePath = basePath
        self.client = client
    }
}
