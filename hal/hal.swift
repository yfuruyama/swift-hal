//
//  hal.swift
//  hal
//
//  Created by Yuki Furuyama on 2015/01/01.
//  Copyright (c) 2015年 Yuki Furuyama. All rights reserved.
//

import Foundation

public class HAL {
    public class func parse(string: String) -> HALResource {
        return HALResource(JSON.parse(string))
    }
}

public class HALResource : JSON {
    override init(_ json: JSON) {
        super.init(json)
    }
    
    public func link(key: String) -> HALLink? {
        let links = self.links(key)
        return links.count > 0 ? links[0] : nil
    }
    
    public func links(key: String) -> [HALLink] {
        if let links = self["_links"][key].asArray {
            return links.map { l in HALLink(l) }
        } else if !self["_links"][key].isError {
            return [HALLink(self["_links"][key])]
        } else {
            return []
        }
    }
    
    public func links() -> [String: AnyObject] {
        var allLinks = [String: AnyObject]()
        if let dict = self["_links"].asDictionary {
            for (k: String, v: JSON) in dict {
                if let links = v.asArray {
                    allLinks[k] = links.map { l in HALLink(l) }
                } else {
                    allLinks[k] = HALLink(v)
                }
            }
        }
        return allLinks
    }
    
    public func embedded() -> [HALResource]? {
        if let embedded = self["_embedded"].asArray {
            return embedded.map { e in HALResource(e) }
        }
        return nil
    }
}

public class HALLink : JSON {
    override init(_ json: JSON) {
        super.init(json)
    }
    
    public func href() -> String? {
        return self["href"].asString
    }
    
    public func templated() -> Bool {
        if let templated = self["templated"].asBool {
            return templated
        }
        return false
    }
    
    public func type() -> String? {
        return self["type"].asString
    }
    
    public func deprecation() -> String? {
        return self["deprecation"].asString
    }
    
    public func name() -> String? {
        return self["name"].asString
    }
    
    public func profile() -> String? {
        return self["profile"].asString
    }
    
    public func title() -> String? {
        return self["title"].asString
    }
    
    public func hreflang() -> String? {
        return self["hreflang"].asString
    }
}