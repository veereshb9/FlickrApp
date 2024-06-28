//
//  NetworkManager.swift
//  FlickrApp
//
//  Created by Veeresh on 6/28/24.
//

import Foundation


enum NetworkError: Error {
    case generic
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private let session : URLSession
    
    init(configuration: URLSessionConfiguration? = nil) {
        session = URLSession(configuration: configuration ?? URLSessionConfiguration.default)
    }
    
    func start<T: Decodable> (request: URLRequest) async throws -> T {
        let (data, response) = try await session.data(for: request)
        if response .isSuccess {
            return try decode(data: data)
        }
        throw NetworkError.generic
    }
    
    func decode<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        print("trying to decode: \(String(data: data, encoding: .utf8) ?? "")")
        return try decoder.decode(T.self, from: data)
        
    }
}
