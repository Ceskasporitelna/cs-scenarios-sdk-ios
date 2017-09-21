//
//  EventsResource.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

class EventsResource: Resource {
    
    public var single: SingleEventsResource {
        return SingleEventsResource(basePath: "\(self.basePath)/single", client: self.client)
    }
    
    public var collection: CollectionEventsResource {
        return CollectionEventsResource(basePath: "\(self.basePath)/collection", client: self.client)
    }
}
