//
//  IntLocalStorage.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

struct IntLocalStorage: ILocalStorage {
    var key: String
    var _default: Int
    let userDefaults: UserDefaults
    
    
    func load() -> Int {
        if userDefaults.object(forKey: key) == nil { return _default }
        return userDefaults.integer(forKey: key)
    }
    
    func save(value: Int) {
        userDefaults.set(value, forKey: key)
    }
    
    func clear(){
        userDefaults.removeObject(forKey: key)
    }
    
    typealias T = Int
}
