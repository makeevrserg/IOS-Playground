//
//  RMCharacterDetauls.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import SwiftUI

struct RMCharacterDetails: View {
    var character: RMCharacter
    var body: some View {
        VStack{
            Text("This is a detail view")
            CharacterCard(character: character)
        }
    }
}
