//
//  CharactersView.swift
//  marvel
//
//  Created by Luis Alvarez on 19/02/2024.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharactersViewModel
    @State private var searchText = ""
    var body: some View {
        VStack(spacing: 0) {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                
            } else {
                HeaderView(searchText: $searchText)
                List(viewModel.characters) { character in
                    Text(character.name)
                        .padding(0)
                }
            }
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}

#Preview {
    CharactersView(viewModel: CharactersViewModel(marvelDataFetcher: MarvelDataFetcher(marvelAPIService: MarvelAPIService())))
}
