//
//  EventsResource.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

/// Events resource to manage posting of single event/collection of events
class EventsResource: Resource {
    
    /// Post an event
    ///
    /// - Parameters:
    ///   - data: Event data
    ///   - completion: Completion method
    public func postSingle(data: Event, completion: @escaping (ApiResult)->()) {
        self.client.callApi(url: "\(self.basePath)/single", method: .post, object: data, completion: completion)
    }
    
    /// Post an event collection
    ///
    /// - Parameters:
    ///   - data: Events array
    ///   - completion: Completion method
    public func postCollection(data: [Event], completion: @escaping (ApiResult)->()) {
        self.client.callApi(url: "\(self.basePath)/collection", method: .post, objects: data, completion: completion)
    }
    
}
