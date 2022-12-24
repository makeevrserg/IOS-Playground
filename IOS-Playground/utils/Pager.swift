//
//  Pager.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

struct Pager<T>{
    var initialPage: Int
    var onNextPageLoaded: ([T]?) -> Void
    var getList: (Int) async -> [T]?
    init(initialPage: Int, onNextPageLoaded: @escaping ([T]?) -> Void, getList: @escaping (Int) async -> [T]?) {
        self.initialPage = initialPage
        self.onNextPageLoaded = onNextPageLoaded
        self.getList = getList
    }
    
    private var isLoading = false
    private var isLastPage = false
    private lazy var currentPage: Int = initialPage
    
    mutating func loadNextPage() async {
        if isLastPage { return }
        isLoading = true
        var list = await getList(currentPage)
        if (list?.isEmpty == true) { isLastPage = true }
        if (list != nil) { currentPage += 1 }
        onNextPageLoaded(list)
        isLoading = false
    }
}
