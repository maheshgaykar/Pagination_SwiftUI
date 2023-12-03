//
//  NetworkManager.swift
//  Pagination_SwiftUI
//
//  Created by mahesh gaykar on 03/12/23.
//

import Foundation

class NetworkManager {
    
    enum UsersFetcherError: Error {
        case invalidURL
        case missingData
    }
    
    static func fetchUsersWithAsyncURLSession(offset: Int, limit: Int) async throws -> Users {
        
        guard let url = URL(string: "https://api.slingacademy.com/v1/sample-data/users?offset=\(offset)&limit=\(limit)") else {
            throw UsersFetcherError.invalidURL
        }
        
        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Parse the JSON data
        let iTunesResult = try JSONDecoder().decode(Users.self, from: data)
        return iTunesResult
    }
    
}
