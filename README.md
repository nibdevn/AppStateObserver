# AppStateObserver

![Swift](https://img.shields.io/badge/Swift-4.2-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/nibdevn/AppStateObserver/blob/master/LICENSE)


## Summary

- [Requirements](#requirements)
- [Usage](#usage)
- [Installation](#installation)
- [Example](#example)

## Requirements

- Swift 4.2
- iOS 10.0+

## Usage

```swift

var  disposeBag: AppStateDisposeBag?

disposeBag = AppStateObserver.subscribe { state in
    switch state {
    case .didBecomeActive:
        print("didBecomeActive")
    case .willResignActive:
        print("willResignActive")
    case .willEnterForeground:
        print("willEnterForeground")
    case .didEnterBackground:
        print("didEnterBackground")
    case .willTerminate:
        print("willTerminate")
    }
}

disposeBag?.dispose()
```

## Installation

AppStateObserver is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AppStateObserver', :tag => '1.0.0', :git => 'https://github.com/nibdevn/AppStateObserver'
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.  

## License

These works are available under the MIT license. See the [LICENSE][license] file
for more info.


[license]: LICENSE

