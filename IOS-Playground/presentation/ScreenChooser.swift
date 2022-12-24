//
//  ScreenChooser.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import Foundation
import SwiftUI
import XNavigation

struct ScreenChooser: View {
    
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        NavigationView {
            VStack {
                Text(Strings.currentLocale(localeCode: LocalizedString.currentLocale))
                Text(Strings.helloWorld.value)
                Text(Strings.chooseScreen.value)
                Button(action: {
                    navigation.pushView(LaunchStoryboardScreen, animated: true)
                }) { Text("Storyboard Main screen") }
                Button(action: {
                    navigation.pushView(MainStoryboardScreen, animated: true)
                }) { Text("Storyboard Launch screen") }
                
                Button(action: {
                    navigation.pushView(FirstScreen(), animated: true)
                }) { Text("First screen") }
                
                Button(action: {
                    navigation.pushView(UserDefaultsScreen(), animated: true)
                }) { Text("User defaults screen") }
            }
            .navigationBarTitle("First Tab", displayMode: .large)
  
        }
    }
}
