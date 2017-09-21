//
//  EventData.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

struct EventData: JSONSerializable {
    var eventTypeId : Int?
    var eventType : EventType?
    var applicationId : Int?
    var application : String?
    var eventCreation : Date?
    var clientId : String?
    var values : Values?
    
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
