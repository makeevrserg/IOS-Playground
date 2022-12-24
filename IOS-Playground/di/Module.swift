//
//  Module.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

struct Module<T> {
    var initializer: () -> T
    
    lazy var value: T = {
        return initializer()
    }()
}


var UserDefaultsModule = Module {
    UserDefaults.standard
}

var LocalDataSourceModule = Module {
    LocalDataSource(userDefaults: UserDefaultsModule.value)
}
