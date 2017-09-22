//
//  Event.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

/// Structure to hold the data of an event
struct Event: JSONSerializable {
    
    /// The event type identifier, eventType is preferred instead.
    var eventTypeId : Int?
    
    /// The event type, possible values: 'API', 'LoadURI', 'Form', 'Custom'.
    var eventType : EventType?
    
    /// Application identifier registering the event, application is preferred instead.
    var applicationId : Int?
    
    /// Application registering the event.
    var application : String?
    
    /// Date and time when the event occurred.
    var eventCreation : Date?
    
    /// Client identifier if not authenticated in headers.
    var clientId : String?
    
    /// Additional event information, JSON object or value without fixed structure.
    var values : Values?
    
    /// JSON representation of the structure
    ///
    /// - Returns: A dictionary with the Event data that can be serialized
    func JSONRepresentation() -> [String: Any] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Scenarios.DateTimeFormat
        
        var json:[String:Any] = [:]
        json["eventTypeId"] = self.eventTypeId
        json["eventType"] = self.eventType?.rawValue
        json["applicationId"] = self.applicationId
        json["application"] = self.application
        json["eventCreation"] = self.eventCreation == nil ? nil : dateFormatter.string(from: self.eventCreation!)
        json["clientId"] = self.clientId
        json["values"] = self.values?.JSONRepresentation()
        
        return json
    }
}
