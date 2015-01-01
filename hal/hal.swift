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
    
    public func links(key: String) -> HALLink {
        let link = JSON(self["_links"][key])
        return HALLink(link)
    }
    
    public func links() -> [String: HALLink] {
        var links = [String: HALLink]()
        if let dict = self["_links"].asDictionary {
            for (k, v) in dict {
                links[k] = HALLink(v)
            }
        }
        return links
    }
    
    public func embedded() -> [HALResource]? {
        let embedded = self["_embedded"].asArray;
        return embedded?.map { e in HALResource(e) }
    }
}

public class HALLink : JSON {
    override init(_ json: JSON) {
        super.init(json)
    }
    
    public func href() -> String? {
        return self["href"].asString
    }
    
    public func templated() -> Bool? {
        return self["templated"].asBool
    }
}