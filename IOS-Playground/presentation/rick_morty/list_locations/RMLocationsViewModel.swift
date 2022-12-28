//
//  RMLocationsViewModel.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 28.12.2022.
//

import Foundation

class RMLocationListViewModel: ViewModel {
    private var api = RickMortyAPIModule.value
    @Published var list: [RMLocation] = []
    
    private lazy var charactersPaging = Pager<RMLocation>(initialPage: 0, onNextPageLoaded: {list in
        var nonNullList: [RMLocation] = list ?? []
        DispatchQueue.main.async {
            self.list.append(contentsOf: nonNullList)
        }
    }, getList: { page in
        var result = await self.api.fetchLocations(page: page)
        return catching {
            try result.get().results
        }
    })
    func loadNextPage() {
        Task{ await self.charactersPaging.loadNextPage() }
    }
    override init(){
        super.init()
        self.loadNextPage()
    }
}


