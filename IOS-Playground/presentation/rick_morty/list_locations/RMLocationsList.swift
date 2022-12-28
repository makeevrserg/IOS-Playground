//
//  RMLocationsList.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 28.12.2022.
//

import SwiftUI
import XNavigation
import URLImage


struct RMLocationsList: View {
    @EnvironmentObject var navigation: Navigation
    @ObservedObject var viewModel = RMLocationListViewModel()
    
    var body: some View {
        List(viewModel.list, id: \.id) { item in

            LocationCard(location: item)
            .onAppear(){
                if (self.viewModel.list.last?.id == item.id){
                    viewModel.loadNextPage()
                }
            }
            .onTapGesture {
            }

        }
    }
}
