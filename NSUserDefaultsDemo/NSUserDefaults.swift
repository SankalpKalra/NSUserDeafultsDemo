//
//  NSUserDefaults.swift
//  NSUserDefaultsDemo
//
//  Created by Appinventiv on 26/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

enum NSUserDefaults{
    static func save(_ value:Any,forKey key:String){
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
   
    static func retrieveObjectValue(_ key:String) -> AnyObject? {
        if let value =  UserDefaults.standard.object(forKey: key) {
            return value as AnyObject
        }
        else {
            return nil
        }
    }
    
    static func retrieveStringValue(_ key:String)->String?{
        if let value = UserDefaults.standard.object(forKey: key) as? String{
            return value
        }
        return nil
    }
}
