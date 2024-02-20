//
//  CharactersViewModel.swift
//  marvel
//
//  Created by Luis Alvarez on 19/02/2024.
//

import SwiftUI

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false

    private let marvelDataFetcher: MarvelDataFetcher
    
    init(marvelDataFetcher: MarvelDataFetcher) {
        self.marvelDataFetcher = marvelDataFetcher
        fetchCharacters()
    }
    
    func fetchCharacters() {
        isLoading = true
        marvelDataFetcher.fetchCharacters { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self.characters = characters
                case .failure(let error):
                    print("Failed to fetch characters: \(error)")
                }
                self.isLoading = false
            }
        }
    }
}

