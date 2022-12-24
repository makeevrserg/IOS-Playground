//
//  RickMortyAPI.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import Alamofire

class RickMortyAPI {
    static var BASE_URL = "https://rickandmortyapi.com/api/"

    static func path(path: String) -> String {
        return "\(BASE_URL)\(path)"
    }

    func fetchCharacters(page: Int) async -> Result<RMCharacters, AFError> {
        let parameters = ["page": page]
        let request = AF.request(RickMortyAPI.path(path: "character"), method: .get, parameters: parameters)
        let task = request.serializingDecodable(RMCharacters.self)
        let result = await task.result
        return result

    }
}
