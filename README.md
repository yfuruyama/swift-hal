swift-hal
===
[Hypertext Application Language](http://stateless.co/hal_specification.html) Parser for Swift.

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

Interface
---
```
- HAL
  - `class func parse(string: String) -> HALResource`: parse a HAL-JSON string
- HALResource
  - `func link(key: String) -> HALLink?`: get a link object from the key.
  - `func links(key: String) -> [HALLink]`: get an array of link objects from the key.
  - `func links() -> [String: AnyObject]`: get all link objects. AnyObject is either type of HALLink or [HALLink].
  - `func hasCuries() -> Bool`: check whether CURIEs exists in HAL resource.
  - `func curie(key: String) -> HALLink?`: get the CURIE link object specified by the key.
  - `func curies() -> [HALLink]`: get all CURIEs link objects.
  - `func embedded() -> [HALResource]?`: get embedded resource objects.
- HALLink
  - `func href() -> String?`: get "href" property of link object.
  - `func templated() -> Bool`: check the link object consists of URI template.
  - `func type() -> String?`: get "type" property of link object.
  - `func deprecation() -> String?`: get "deprecation" property of link object.
  - `func name() -> String?`: get "name" property of link object.
  - `func profile() -> String?`: get "profile" property of link object.
  - `func title() -> String?`: get "title" property of link object.
  - `func hreflang() -> String?`: get "hreflang" property of link object.
```

LICENSE
---
MIT
