swift-hal
===
Hypertext Application Language Parser for Swift.

Requirements
---
[swift-json](https://github.com/dankogai/swift-json)

Usage
---
```swift
let json = "{\"_links\":{\"self\": { \"href\": \"/orders\" }}}"
let hal: HALResource = HAL.parse(json)
let href: String? = hal.link("self")!.href()
```

LICENSE
---
MIT License
