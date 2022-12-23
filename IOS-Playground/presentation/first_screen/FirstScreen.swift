//
//  FirstScreen.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import SwiftUI
import XNavigation

struct FirstScreen: View {
    
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Button(action: {
                    navigation.pushView(SecondScreen(), animated: true)
                }) { Text("Press to push!") }
            }
            .navigationBarTitle("First Tab", displayMode: .large)
  
        }
    }
}
