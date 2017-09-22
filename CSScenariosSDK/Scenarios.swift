//
//  Scenarios.swift
//  ScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

class Scenarios: NSObject {
    
    fileprivate static var _sharedInstance : Scenarios!
    
    /// Datetime format for dates in ISO 8601 formatting 
    public static let DateTimeFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    
    /// Scenarios API client
    public internal (set) var client: ScenariosClient
    
    /// Scenarios SDK shared instance
    public class var sharedInstance: Scenarios {
        return _sharedInstance
    }
    
    /// Initialize Scenarios SDK using required information distributed through configuration object
    ///
    /// - Parameter webApiConfiguration: Configuration object for client initialization
    init( webApiConfiguration : WebApiConfiguration ) {
        self.client = ScenariosClient( config: webApiConfiguration )
        super.init()
        Scenarios._sharedInstance = self
    }

}
