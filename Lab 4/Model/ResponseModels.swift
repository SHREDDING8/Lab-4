//
//  ResponseModels.swift
//  Lab 4
//
//  Created by SHREDDING on 08.07.2023.
//

import Foundation

// MARK: - Welcome
struct CharactersJsonResponse: Codable {
    let info: Info
    let results: [Result]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: String?
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
