//
//  MarvelAPIService.swift
//  marvel
//
//  Created by Luis Alvarez on 19/02/2024.
//

import Foundation
import CryptoKit

class MarvelAPIService {
    private let baseUrl: URL
    private let publicKey: String
    private let privateKey: String
    
    init() {
        guard let apiUrlString = Bundle.main.infoDictionary?["MARVEL_API_URL"] as? String,
              let url = URL(string: apiUrlString.replacingOccurrences(of: "\\/", with: "/")),
              let publicKey = Bundle.main.infoDictionary?["MARVEL_PUBLIC_KEY"] as? String,
              let privateKey = Bundle.main.infoDictionary?["MARVEL_PRIVATE_KEY"] as? String else {
            fatalError("Invalid or missing API URL, public key, or private key")
        }
        
        self.baseUrl = url
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    func authenticatedUrlString(forPath path: String) -> String {
        let timestamp = String(Date().timeIntervalSince1970)
        let hash = (timestamp + privateKey + publicKey).md5
        
        let url = baseUrl.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "hash", value: hash)
        ]
        
        guard let finalUrl = components.url else {
            fatalError("Invalid URL for path: \(path)")
        }
        return finalUrl.absoluteString
    }
}

extension String {
    var md5: String {
        let data = Data(self.utf8)
        return Insecure.MD5.hash(data: data).map { String(format: "%02hhx", $0) }.joined()
    }
}
