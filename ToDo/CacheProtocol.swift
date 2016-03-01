//
//  CacheProtocol.swift
//  ToDo
//
//  Created by Jack Bretcher on 2/29/16.
//  Copyright © 2016 Sonoma Enterprises. All rights reserved.
//

import Foundation

protocol CacheProtocol {
    func LoadObjectForkey(key: String) -> AnyObject?
    
    func saveObjecty(object: AnyObject, key:String)
}