//
//  utilities.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

func catching<T>(block: () throws -> T) -> T? {
    do {
        return try block()
    } catch {
        return nil
    }
}
