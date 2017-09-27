# Using ScenariosSDK
Scenarios allow you to post an event or collection of events .

## Before You Begin

Before using ScenariosSDK in your application, you need to initialize it by providing it your WebApiKey.

```swift
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Initialize scenarios
        let config = WebApiConfiguration(webApiKey: "your-api-key",
                                         environment: "your-environment", // default is Environment.systemTest
                                         language: "your-language", // default is "cs-CZ"
                                         authorizationToken: "yout-auth-token")
        Scenarios.initialize(webApiConfiguration: config)
        
        // Obtain your scenarios client
        let client = Scenarios.sharedInstance.client
        return true
    }
```

## Resources
These resources are available on the `ScenariosClient`.

- [`EventsResource`](../CSScenariosSDK/EventsResource.swift) - Post single event or collection of events.

To get resource instances see the following code snippet.

```swift

    // Get EventsResource Instance
    let accountsResource = scenariosClient.events

```

## Usage
This usage guide walks you through a process of posting events.

### 1. Post single event

You can post a single event using [`EventsResource`](../CSScenariosSDK/EventsResource.swift) method `postSingle`. See also [`Events`](../CSScenariosSDK/Event.swift) for creation the single event.

``` swift

    // Create event
    let event = Event(eventTypeId: "your-event-type-id",
                              eventType: "your-event-type",
                              applicationId: "your-application-id",
                              application: "your-application",
                              eventCreation: "your-event-creation-date",
                              clientId: "your-client-id",
                              values: ["your-first-key": "your-first-value", "your-second-key": "your-second-value"])
                
       
    // Post your single event
    scenariosClient.events
        .postSingle(event, callback: {
            // handle result
        });
```

### 2. Post collection of events

You can post a collection of events using [`EventsResource`](../CSScenariosSDK/EventsResource.swift) method `postCollection`. See also [`Events`](../CSScenariosSDK/Event.swift) for creation the single event.

``` swift

    // Post collection of events
    scenariosClient.events
        .postCollection([firstEvent, secoindEvent], callback: {
            // handle result
        });
            
``` 

## Further documentation
Please see the documented [public API of the ScenariosSDK](../scenarios/src/main/java/cz/csas/scenarios/) for detailed description of the functionalities provided by this SDK.

This SDK communicates with Scenarios API. You can have a look at its [documentation](http://docs.ext0csasscenarioseventsv1.apiary.io/#).
