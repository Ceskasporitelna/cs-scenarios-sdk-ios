//
//  Scenarios.swift
//  ScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

class Scenarios: NSObject {
    
    fileprivate static var _sharedInstance : Scenarios?
    
    fileprivate var _client: ScenariosClient?
    
    fileprivate var configuration: WebApiConfiguration?
    
    /// Datetime format for dates in ISO 8601 formatting 
    public static let DateTimeFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    
    /// Scenarios API client
    public var client: ScenariosClient! {
        get {
            if self._client == nil {
                self._client = ScenariosClient( config: self.configuration! )
            }
            return self._client
        }
    }
    
    /// Scenarios SDK shared instance
    public class var sharedInstance: Scenarios {
        if _sharedInstance == nil {
            print ("Scenarios not initialized. Please initialize Scenarios with webApiConfiguration first.")
        }
        return _sharedInstance!
    }
    
    /// Initialize Scenarios SDK using required information distributed through configuration object
    ///
    /// - Parameter webApiConfiguration: Configuration object for client initialization
    public class func initialize( webApiConfiguration : WebApiConfiguration ) {
        Scenarios._sharedInstance = Scenarios(webApiConfiguration: webApiConfiguration)
    }
    
    /// Private initializer for the shared instance
    private init(webApiConfiguration: WebApiConfiguration) {
        self.configuration = webApiConfiguration
    }
    
    /// Disallow default initializer
    private override init() {}

}
