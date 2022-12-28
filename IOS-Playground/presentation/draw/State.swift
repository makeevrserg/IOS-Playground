//
//  State.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import PhotosUI
import _PhotosUI_SwiftUI

enum DrawStateEnum {
    case Pending
    case Selected
}

final class DrawPendingState: DrawState, ObservableObject {
    typealias EnumState = DrawStateEnum
    var enumState: DrawStateEnum = DrawStateEnum.Pending
}
@available(iOS 16.0, *)
final class DrawSelectedState: DrawState, ObservableObject {
    typealias EnumState = DrawStateEnum
    var enumState: DrawStateEnum = DrawStateEnum.Selected
    var image: PhotosPickerItem
    var data: Data

    init(image: PhotosPickerItem, data: Data) {
        self.image = image
        self.data = data
    }
}



protocol DrawState: ViewState where EnumState == DrawStateEnum {
    
    
}
