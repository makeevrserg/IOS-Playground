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

