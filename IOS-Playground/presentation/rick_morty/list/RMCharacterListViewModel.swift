//
//  RMCharacterListViewModel.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

class RMCharacterListViewModel: ObservableObject {
    private var api = RickMortyAPIModule.value
    @Published var list: [RMCharacter] = []
    
    private lazy var charactersPaging = Pager<RMCharacter>(initialPage: 0, onNextPageLoaded: {list in
        var nonNullList: [RMCharacter] = list ?? []
        DispatchQueue.main.async {
            self.list.append(contentsOf: nonNullList)
        }
    }, getList: { page in
        var result = await self.api.fetchCharacters(page: page)
        return catching {
            try result.get().results
        }
    })
    func loadNextPage() {
        Task{ await self.charactersPaging.loadNextPage() }
    }
    init(){
        loadNextPage()
    }
}




