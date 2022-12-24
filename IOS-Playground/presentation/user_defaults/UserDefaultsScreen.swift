//
//  UserDefaultsScreen.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import SwiftUI

struct UserDefaultsScreen: View {
    @ObservedObject private var viewModel = UserDefaultScreenViewModel()
    var body: some View {
        VStack{
            Text("Saved value: \(viewModel.savedValueString)")
            TextField("Input value",text: $viewModel.nullableString)
            Button {
                viewModel.load()
            } label: {
                Text("Load")
            }
            
            Button {
                viewModel.save()
            } label: {
                Text("Save")
            }
        }
    }
}

struct UserDefaultsScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsScreen()
    }
}
