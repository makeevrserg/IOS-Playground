//
//  DrawScreen.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import SwiftUI
import PhotosUI

struct DrawScreen: View {
    @ObservedObject var viewModel: DrawViewModel = DrawViewModel()


    var body: some View {
        switch (viewModel.state.enumState) {
        case .Pending: PendingScreen { item, data in
            viewModel.onImagesSelected(image: item, data: data)
        }
        case .Selected: SelectedScreen(state: viewModel.state as! DrawSelectedState, viewModel: viewModel)
        }
    }
}

