//
//  ViewState.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

protocol ViewState<EnumState>{
    associatedtype EnumState
    var enumState: EnumState { get }
}
