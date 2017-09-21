//
//  SingleEventsResource.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

class SingleEventsResource: Resource {
    
    public func post(data: EventData, completion: @escaping (ApiResult)->()) {
        self.client.callApi(url: self.basePath, method: .post, object: data, completion: completion)
    }
}
