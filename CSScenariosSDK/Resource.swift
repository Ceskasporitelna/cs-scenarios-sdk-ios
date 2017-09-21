//
//  Resource.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 20.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

class Resource: NSObject {
    
    let basePath: String
    let client: NetworkClient
    
    init(basePath: String, client: NetworkClient) {
        self.basePath = basePath
        self.client = client
    }
}
