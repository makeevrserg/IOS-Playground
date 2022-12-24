//
//  ILocalStorage.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

protocol ILocalStorage<T> {
    associatedtype T
    var key: String { get }
    func load() -> T
    func save(value: T)
    func clear()
}

struct NStringLocalStorage: ILocalStorage {
    
    let userDefaults: UserDefaults
    var key: String

    
    func load() -> String? {
        return userDefaults.string(forKey: key)
    }
    
    func save(value: String?) {
        
        if let nonNullValue = value {
            userDefaults.set(nonNullValue, forKey: key)
        } else {
            clear()
        }
        
    }
    
    func clear(){
        userDefaults.removeObject(forKey: key)
    }
    
    typealias T = String?
}
