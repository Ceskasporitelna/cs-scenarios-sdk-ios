//
//  CollectionEventsResource.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

/// Resource for posting events collections
class CollectionEventsResource: Resource {
    
    /// Post an event collection
    ///
    /// - Parameters:
    ///   - data: Events array
    ///   - completion: Completion method
    public func post(data: [Event], completion: @escaping (ApiResult)->()) {
        self.client.callApi(url: self.basePath, method: .post, objects: data, completion: completion)
    }
}
