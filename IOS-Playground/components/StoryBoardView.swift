//
//  StoryBoardView.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import Foundation
import SwiftUI

struct StoryBoardView: UIViewControllerRepresentable{
    var name: String
    var identifier: String
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: name,bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier)
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

var LaunchStoryboardScreen: StoryBoardView {
  get { return StoryBoardView(name: "LaunchScreen", identifier: "LaunchStoryboard") }
}
var MainStoryboardScreen: StoryBoardView {
  get { return StoryBoardView(name: "Main", identifier: "MainStoryboard") }
}
