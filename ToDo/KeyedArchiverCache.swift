//
//  KeyedArchiverCache.swift
//  ToDo
//
//  Created by Jack Bretcher on 3/2/16.
//  Copyright © 2016 Sonoma Enterprises. All rights reserved.
//

import Foundation


class KeyedArchiverCache: CacheProtocol{
    func LoadObjectForkey(key: String) -> AnyObject? {
            let path = self.archivePath(key)
        return NSKeyedUnarchiver.unarchiveObjectWithFile(path)
    }
    
    func saveObjecty(object: AnyObject, key:String){
        let path = self.archivePath(key)
        NSKeyedArchiver.archiveRootObject(object, toFile: path)
    }
    
    //MARL:  Untilities
    
    private func archivePath(key: String) -> String {
        let  path=NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, .UserDomainMask, true)[0]
        
        var URL = NSURL(string: path )!
        
        URL = URL.URLByAppendingPathComponent(key)
        URL = URL.URLByAppendingPathExtension("Archive")
        return URL.absoluteString  as String
    }
    
}