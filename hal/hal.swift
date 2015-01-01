//
//  hal.swift
//  hal
//
//  Created by Yuki Furuyama on 2015/01/01.
//  Copyright (c) 2015年 Yuki Furuyama. All rights reserved.
//

import Foundation

public class HAL : JSON {
    public func links() -> HAL {
        return HAL(self["_links"])
    }
    
    public func links(key:String) -> String? {
        return self["_links"][key].asString;
    }
    
    public func embedded() -> [HAL]? {
        let embedded = self["_embedded"].asArray;
        return embedded?.map { e in HAL(e) }
    }
}