//
//  UserDefaultsCache.swift
//  ToDo
//
//  Created by Jack Bretcher on 2/29/16.
//  Copyright © 2016 Sonoma Enterprises. All rights reserved.
//

import Foundation

class UserDefaultsCache: CacheProtocol{
    func LoadObjectForkey(key: String) -> AnyObject? {
        return NSUserDefaults.standardUserDefaults().objectForKey(key)
    }
    
    func saveObjecty(object: AnyObject, key:String){
        NSUserDefaults.standardUserDefaults().setObject(object, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}