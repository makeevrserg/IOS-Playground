//
//  CharacterCard.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import URLImage
import SwiftUI

struct CharacterCard: View{
    var character: RMCharacter
    init(character: RMCharacter) {
        self.character = character
    }
    var body: some View {
        HStack{
            Group{
                URLImage(URL(string: character.image)!) { image in
                    image
                        .resizable()
                        .frame(width: 64, height: 64)
                        .aspectRatio(contentMode: .fit)
                }
            }.frame(width: 64, height: 64)
            VStack(alignment: HorizontalAlignment.leading) {
                Text(character.name ?? "-")
                Text(character.gender ?? "-")
                Text(character.species ?? "-")
            }
        }
    }
}
