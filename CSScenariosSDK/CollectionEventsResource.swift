//
//  CollectionEventsResource.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

class CollectionEventsResource: Resource {
    
    public func post(data: [EventData], completion: @escaping (ApiResult)->()) {
        self.client.callApi(url: self.basePath, method: .post, objects: data, completion: completion)
    }
}
