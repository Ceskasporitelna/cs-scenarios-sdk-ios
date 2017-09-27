# CSScenarios SDK

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

This SDK allows you to post events into Česká spořitelna a.s. [Scenarios API](http://docs.ext0csasscenarioseventsv1.apiary.io/#).

# [CHANGELOG](CHANGELOG.md)

# Requirements

- iOS 8.1+
- Xcode 8.3+

# CSScenariosSDK Installation

## Install through Carthage

If you use [Carthage](https://github.com/Carthage/Carthage) you can add a dependency on CSScenariosSDK by adding it to your Cartfile:

```
github 'Ceskasporitelna/cs-scenarios-sdk-ios'
```

## Install through CocoaPods

You can install CSScenariosSDK by adding the following line into your Podfile:

```ruby
#Add Ceska sporitelna pods specs respository
source 'https://github.com/Ceskasporitelna/cocoa-pods-specs.git'
source 'https://github.com/CocoaPods/Specs.git'

pod 'CSScenariosSDK'
```

# Usage

After you've installed the SDK using Carthage or CocoaPods You can simply import the module wherever you wish to use it:

```swift
import CSScenariosSDK
```

## Configuration

You have to configure and initialize CSCoreSDK before using CSScenarios SDK.

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

## Usage guide

**See [Usage Guide](./docs/scenarios.md)** for usage instructions.

# Contributing

Contributions are more than welcome!

Please read our [contribution guide](CONTRIBUTING.md) to learn how to contribute to this project.

# Terms and License

Please read our [terms & conditions in license](LICENSE.md)
