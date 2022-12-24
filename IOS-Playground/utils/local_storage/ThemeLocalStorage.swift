//
//  ThemeLocalStorage.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

struct ThemeLocalStorage: ILocalStorage {

    var key: String
    var _default: Theme
    let userDefaults: UserDefaults
    
    
    func load() -> Theme {
        if userDefaults.object(forKey: key) == nil { return _default }
        let intValue = userDefaults.integer(forKey: key)
        
        return Theme(rawValue: intValue) ?? .device
    }
    
    func save(value: Theme) {
        userDefaults.set(value.rawValue, forKey: key)
    }
    
    func clear(){
        userDefaults.removeObject(forKey: key)
    }
    
    typealias T = Theme
}
