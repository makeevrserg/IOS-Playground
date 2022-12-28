//
//  RMCharacters.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

struct RMInfo: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct RMCharacter: Decodable {
    var id: Int
    var name: String?
    var status: String?
    var species: String?
    var gender: String?
    var image: String
}

struct RMLocation: Decodable {
    var id: Int
    var name: String?
    var type: String?
    var dimension: String?
}

struct RMCharacters: Decodable {
    var info: RMInfo
    var results: [RMCharacter]
}

struct RMLocations: Decodable {
    var info: RMInfo
    var results: [RMLocation]
}
