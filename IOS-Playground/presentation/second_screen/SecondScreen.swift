//
//  SecondScreen.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import SwiftUI
import XNavigation

struct SecondScreen: View, DestinationView {
    @EnvironmentObject var navigation: Navigation

    var navigationBarTitleConfiguration = NavigationBarTitleConfiguration(title: "Second Detail Detail", displayMode: .inline)

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(action: {
                navigation.pop(animated: true)
            }) { Text("Press to pop!") }
        }
        .navigationBarTitle(configuration: navigationBarTitleConfiguration)
    }
}

struct SecondDetailModalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
