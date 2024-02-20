//
//  Character.swift
//  marvel
//
//  Created by Luis Alvarez on 19/02/2024.
//

import Foundation

struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let resourceURI: String
    let urls: [Url]
    let thumbnail: Image
    let comics: ResourceList
    let stories: ResourceList
    let events: ResourceList
    let series: ResourceList
}

struct Url: Codable {
    let type: String
    let url: String
}

struct Image: Codable {
    let path: String
    let `extension`: String
}

struct ResourceList: Codable {
    let available: Int
    let collectionURI: String
    // Add more properties as needed
}
