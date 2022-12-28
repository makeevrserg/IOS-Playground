//
//  ScreenChooser.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import SwiftUI
import XNavigation
import UIKit

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
                    RickMortyTabView()
                }
//                ChooserButton(title: "Draw screen", navigation: navigation) {
//                    DrawScreen()
//                }
                BackgroundButton(title: "Dark theme") {
                    LocalDataSourceModule.value.theme.save(value: Theme.dark)
                    navigation.window.overrideUserInterfaceStyle = LocalDataSourceModule.value.theme.load().getUserInterfaceStyle()
                    Utils.vibrate()
                }
                BackgroundButton(title: "Light theme") {
                    LocalDataSourceModule.value.theme.save(value: Theme.light)
                    navigation.window.overrideUserInterfaceStyle = LocalDataSourceModule.value.theme.load().getUserInterfaceStyle()
                    Utils.vibrate()
                }
                
                BackgroundButton(title: "Notification") {
                    //creating the notification content
                     let content = UNMutableNotificationContent()
                     
                     //adding title, subtitle, body and badge
                     content.title = "IOS-Playground"
                     content.subtitle = "This is a sample subtitle"
                     content.body = "Very long body very very a lot of words in this body"
                     content.badge = 1
                     
                     //getting the notification trigger
                     //it will be called after 5 seconds
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
                     
                     //getting the notification request
                     let request = UNNotificationRequest(identifier: "makeevrserg", content: content, trigger: trigger)
                             
                     //adding the notification to notification center
                    UNUserNotificationCenter.current().add(request){ error in
                        if let error = error {
                            print(error)
                        }
                        
                    }
                        
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
