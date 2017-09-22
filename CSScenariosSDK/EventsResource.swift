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
    
    /// Resource for posting single events
    public var single: SingleEventsResource {
        return SingleEventsResource(basePath: "\(self.basePath)/single", client: self.client)
    }
    
    /// Resource for posting events collections
    public var collection: CollectionEventsResource {
        return CollectionEventsResource(basePath: "\(self.basePath)/collection", client: self.client)
    }
}
