//
//  MarvelResponse.swift
//  marvel
//
//  Created by Luis Alvarez on 19/02/2024.
//

import Foundation

struct MarvelResponse<T: Codable>: Codable {
    let code: Int
    let status: String
    let etag: String
    let data: ResponseData<T>
}

struct ResponseData<T: Codable>: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [T]
}
