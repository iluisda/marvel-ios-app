//
//  CharactersViewModel.swift
//  marvel
//
//  Created by Luis Alvarez on 19/02/2024.
//

import SwiftUI

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    private let marvelDataFetcher: MarvelDataFetcher
    
    init(marvelDataFetcher: MarvelDataFetcher) {
        self.marvelDataFetcher = marvelDataFetcher
        fetchCharacters()
    }
    
    func fetchCharacters() {
        marvelDataFetcher.fetchCharacters { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    print("Fetched characters:", characters)
                    self.characters = characters
                case .failure(let error):
                    print("Failed to fetch characters: \(error)")
                }
            }
        }
    }
}

