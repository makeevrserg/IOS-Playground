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

class DrawViewModel: ViewModel {
    @Published var state: any ViewState<DrawStateEnum> = DrawPendingState()
    
    
    func onImagesSelected(image: PhotosPickerItem, data: Data) {
        state = DrawSelectedState(image: image, data: data) as any ViewState<DrawStateEnum>
    }
    func cancelSelection(){
        state = DrawPendingState() as any ViewState<DrawStateEnum>
    }
    

}

