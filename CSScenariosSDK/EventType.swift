//
//  EventType.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 20.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

/// Event type enum
///
/// - api: API event type
/// - loadUri: LoadURI event type
/// - form: Form event type
/// - custom: Custom event type
enum EventType: String {
    case api = "API"
    case loadUri = "LoadURI"
    case form = "Form"
    case custom = "Custom"
}
