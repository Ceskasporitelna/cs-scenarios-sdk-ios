//
//  SingleEventsResource.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

/// Resource for posting single events
class SingleEventsResource: Resource {
    
    /// Post an event
    ///
    /// - Parameters:
    ///   - data: Event data
    ///   - completion: Completion method
    public func post(data: Event, completion: @escaping (ApiResult)->()) {
        self.client.callApi(url: self.basePath, method: .post, object: data, completion: completion)
    }
}
