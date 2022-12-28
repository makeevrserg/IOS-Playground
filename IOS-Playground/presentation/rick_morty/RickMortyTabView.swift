//
//  RickMortyTabView.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 28.12.2022.
//

import SwiftUI

struct RickMortyTabView: View {
    var body: some View {
        TabView {
            RickMortyCharacterList()
                .tabItem {
                    Label("Characters", systemImage: "person.fill")
                }
            RMLocationsList()
                .tabItem {
                    Label("Location", systemImage: "location.fill")
                }
        }
    }
}

