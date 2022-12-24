//
//  Color.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import SwiftUI

class Colors {

    static var colorPrimaryVariant = ColorWrapper(id: "colorPrimaryVariant")
    static var colorPrimary = ColorWrapper(id: "colorPrimary")
    static var colorOnPrimary = ColorWrapper(id: "colorOnPrimary")
    static var colorOnSecondary = ColorWrapper(id: "colorOnSecondary")
    static var colorHint = ColorWrapper(id: "colorHint")
    static var colorSecondary = ColorWrapper(id: "colorSecondary")
    static var colorSecondaryVariant = ColorWrapper(id: "colorSecondaryVariant")
}

struct ColorWrapper{
    var id: String
    lazy var color: Color = Color(id)
    lazy var uiColor: UIColor = UIColor(named: id)!
}
