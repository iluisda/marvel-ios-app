//
//  MarvelDataFetcher.swift
//  marvel
//
//  Created by Luis Alvarez on 19/02/2024.
//

import Foundation

class MarvelDataFetcher {
    private let marvelAPIService: MarvelAPIService
    
    init(marvelAPIService: MarvelAPIService) {
        self.marvelAPIService = marvelAPIService
    }
    
    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        let apiUrlString = marvelAPIService.authenticatedUrlString(forPath: "characters")
        
        guard let url = URL(string: apiUrlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(MarvelResponse<Character>.self, from: data)
                completion(.success(responseData.data.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
