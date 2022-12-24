//
//  UserDefaultScreenViewModel.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import SwiftUI

class UserDefaultScreenViewModel: ObservableObject {
    private var localDataSource = LocalDataSourceModule.value
    @Published var nullableString: String = "-"
    @Published var savedValueString: String = "-"
    
    init(localDataSource: LocalDataSource = LocalDataSourceModule.value) {
        self.localDataSource = localDataSource
        self.load()
    }
    
    func load(){
        nullableString = localDataSource.savedNullableString.load() ?? "-"
        savedValueString = nullableString
    }
    func save(){
        localDataSource.savedNullableString.save(value: nullableString)
    }
}
