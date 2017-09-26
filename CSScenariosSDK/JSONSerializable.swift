//
//  JSONSerializable.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 12.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit
import Foundation

/// JSONSerializable is an object that can be converted to a dictionary representation directly serializable to JSON
protocol JSONSerializable {
    func JSONRepresentation() -> [String: Any]
}

extension JSONSerializable {
    /// Serializes the object to JSON Data
    ///
    /// - Returns: Data with the JSON values to be embeded in HTTP request body
    func toJSONData() -> Data? {
        let representation = JSONRepresentation()
        
        guard JSONSerialization.isValidJSONObject(representation) else {
            print("Invalid JSON Representation")
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: representation, options: [])
            return data
        } catch {
            return nil
        }
    }
}
