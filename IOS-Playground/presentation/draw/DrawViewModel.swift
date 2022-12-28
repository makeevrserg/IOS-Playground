//
//  File.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import Combine
import SwiftUI
import PhotosUI


@available(iOS 16.0, *)
class DrawViewModel: ViewModel {
    @Published var state: any DrawState = DrawPendingState()


    func onImagesSelected(image: PhotosPickerItem, data: Data) {
        state = DrawSelectedState(image: image, data: data) as any DrawState
    }

    func cancelSelection() {
        state = DrawPendingState() as any DrawState
    }


}

