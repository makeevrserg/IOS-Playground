//
//  ScreenChooser.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import SwiftUI
import XNavigation

struct ScreenChooser: View {
    
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        NavigationView {
            VStack {
                Text(Strings.currentLocale(localeCode: LocalizedString.currentLocale)).foregroundColor(Colors.colorOnPrimary.color)
                Text(Strings.helloWorld.value).foregroundColor(Colors.colorOnPrimary.color)
                Text(Strings.chooseScreen.value).foregroundColor(Colors.colorOnPrimary.color)
                
                ChooserButton(title: "Storyboard Main screen", navigation: navigation) {
                    LaunchStoryboardScreen
                }
                ChooserButton(title: "First screen", navigation: navigation) {
                    FirstScreen()
                }
                ChooserButton(title: "User defaults screen", navigation: navigation) {
                    UserDefaultsScreen()
                }
                ChooserButton(title: "RickMorty Characters", navigation: navigation) {
                    RickMortyCharacterList()
                }
                BackgroundButton(title: "Dark theme") {
                    LocalDataSourceModule.value.theme.save(value: Theme.dark)
                    
                    navigation.window.overrideUserInterfaceStyle = LocalDataSourceModule.value.theme.load().getUserInterfaceStyle()
                }
                BackgroundButton(title: "Light theme") {
                    LocalDataSourceModule.value.theme.save(value: Theme.light)
                    navigation.window.overrideUserInterfaceStyle = LocalDataSourceModule.value.theme.load().getUserInterfaceStyle()
                }
            }
            .navigationBarTitle("First Tab", displayMode: .large)
  
        }
    }
}

struct ChooserButton<T>: View where T: View{
    
    var title: String
    var navigation: Navigation
    var viewBuilder: () -> T
    
    var body: some View {
        Button(action: {
            navigation.pushView(viewBuilder(), animated: true)
        }) {
            Text(title)
                .padding(8)
                .background(Colors.colorSecondary.color)
                .foregroundColor(Colors.colorOnSecondary.color)
                .cornerRadius(8)
            
        }
    }
    
}

struct BackgroundButton: View {
    var title: String
    var onClick: () -> Void
    
    var body: some View {
        Button(action: {
            onClick()
        }) {
            Text(title)
                .padding(8)
                .background(Colors.colorSecondary.color)
                .foregroundColor(Colors.colorOnSecondary.color)
                .cornerRadius(8)
            
        }
    }
}
