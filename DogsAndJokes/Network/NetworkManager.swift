//
//  NetworkManager.swift
//  DogsAndJokes
//
//  Created by Vladislav Simonov on 31.07.23.
//

import Foundation

struct NetworkManager {
    
    static func getDogInfo() async throws -> DogModel {
        let endpoint = "https://dog.ceo/api/breeds/image/random"
        
        guard let url = URL(string: endpoint) else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200
        else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(DogModel.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
