//
//  Theme.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import SwiftUI
import UIKit

enum Theme: Int {
    case device
    case light
    case dark
    func getUserInterfaceStyle() -> UIUserInterfaceStyle {
        switch(self){
            case .device: return .unspecified
            case .light: return .light
            case .dark: return .dark
        }
    }
}
