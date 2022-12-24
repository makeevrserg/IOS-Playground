//
//  RickMortyCharacterList.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import SwiftUI
import XNavigation
import URLImage

struct RickMortyCharacterList: View {
    @EnvironmentObject var navigation: Navigation
    @ObservedObject var viewModel = RMCharacterListViewModel()
    var body: some View {
        List(viewModel.list, id: \.id) { item in

            CharacterCard(character: item)
            .onAppear(){
                if (self.viewModel.list.last?.id == item.id){
                    viewModel.loadNextPage()
                }
            }
            .onTapGesture {
                navigation.pushView(RMCharacterDetails(character: item))
            }

        }
    }
}

struct RickMortyCharacterList_Previews: PreviewProvider {
    static var previews: some View {
        RickMortyCharacterList()
    }
}


