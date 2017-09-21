//
//  Scenarios.swift
//  ScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

class Scenarios: NSObject {
    
    public static let DateTimeFormat   = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

    fileprivate static var _sharedInstance : Scenarios!
    
    public internal (set) var client: ScenariosClient
    
    public class var sharedInstance: Scenarios {
        return _sharedInstance
    }
    
    init( webApiConfiguration : WebApiConfiguration ) {
        self.client = ScenariosClient( config: webApiConfiguration )
        super.init()
        Scenarios._sharedInstance = self
    }

}
