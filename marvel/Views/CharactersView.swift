//
//  CharactersView.swift
//  marvel
//
//  Created by Luis Alvarez on 19/02/2024.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharactersViewModel
    
    var body: some View {
        List(viewModel.characters) { character in
            Text(character.name)
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}

#Preview {
    CharactersView(viewModel: CharactersViewModel(marvelDataFetcher: MarvelDataFetcher(marvelAPIService: MarvelAPIService())))
}
