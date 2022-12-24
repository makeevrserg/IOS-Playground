//
//  LocalDataSource.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

struct LocalDataSource {
    var userDefaults: UserDefaults
    
    lazy var savedNullableString: any ILocalStorage<String?> = NStringLocalStorage(userDefaults: userDefaults, key: "saved_nullable_string")
}
