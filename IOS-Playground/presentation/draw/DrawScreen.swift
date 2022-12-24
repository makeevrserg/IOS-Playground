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
        switch(viewModel.state.enumState){
        case .Pending: PendingScreen { item, data in
              viewModel.onImagesSelected(image: item, data: data)
            }
        case .Selected: SelectedScreen(state: viewModel.state as! DrawSelectedState, viewModel: viewModel)
        }
    }
}
private struct SelectedScreen: View {
    var state: DrawSelectedState
    var viewModel: DrawViewModel
    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: state.data)!).resizable()
            
            BackgroundButton(title: "Cancel") {
                viewModel.cancelSelection()
            }
        }
    }
}

private struct PendingScreen: View {
    var onSelected: (PhotosPickerItem, Data) -> Void
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var body: some View {

        VStack{
            Text("Select an Image")
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images){
                Text("Choose")
                    .padding(8)
                    .background(Colors.colorSecondary.color)
                    .foregroundColor(Colors.colorOnSecondary.color)
                    .cornerRadius(8)
            }.onChange(of: selectedItems) { newValue in
                guard let item = selectedItems.first else {
                    return
                }
                item.loadTransferable(type: Data.self){ result in
                    switch result{
                    case .success(let data):
                        if let data = data{
                            self.onSelected(item, data)
                        }
                    default: return
                    }
                }
            }
        }
    }
}
