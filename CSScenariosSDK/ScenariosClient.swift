//
//  ScenariosClient.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

fileprivate let clientPath = "/api/v1/scenarios"
fileprivate let headerWebApiKey = "web-api-key"

/// Scenarios SDK rest client for accessing event resource
class ScenariosClient: NetworkClient {
    
    init(config: WebApiConfiguration ) {
        super.init(baseUrl: config.environment.value)
        self.addHeader(key: headerAuthorization, value: config.authorizationToken);
        self.addHeader(key: headerWebApiKey, value: config.webApiKey);
        self.addHeader(key: headerAcceptLanguage, value: config.language);
    }
    
    /// Get scenarios events resource to create event records
    public var events: EventsResource {
        return EventsResource(basePath:"\(clientPath)/events", client:self)
    }
}
