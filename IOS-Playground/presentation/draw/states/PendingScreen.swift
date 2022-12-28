//
//  PendingScreen.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct PendingScreen: View {
    var onSelected: (PhotosPickerItem, Data) -> Void
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?

    var body: some View {

        VStack {
            Text("Select an Image")
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images) {
                Text("Choose")
                        .padding(8)
                        .background(Colors.colorSecondary.color)
                        .foregroundColor(Colors.colorOnSecondary.color)
                        .cornerRadius(8)
            }
                    .onChange(of: selectedItems) { newValue in
                        guard let item = selectedItems.first else {
                            return
                        }
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data):
                                if let data = data {
                                    self.onSelected(item, data)
                                }
                            default: return
                            }
                        }
                    }
        }
    }
}
