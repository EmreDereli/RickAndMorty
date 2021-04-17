//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by TOS ANALYTICS on 17.04.2021.
//

import Foundation

struct CharacterModel : Decodable{
    let info: Info
    let results: [Result]
}

struct Info: Decodable {
    let count, pages: Int
    let next: String
    let prev: String?
}


struct Result: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}


struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
