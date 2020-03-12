//
//  NetworkManager.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/12/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import Foundation

class NetworkManger {
    
    enum NetworkError: LocalizedError {
        case URLError
        case NetworkError
        case ServerError
        case DataError
        case DecodingError
        
        var title: String {
            switch self {
            case .URLError:
                return "URL Error"
            case .NetworkError:
                return "Network Error"
            case .ServerError:
                return "Server Error"
            case .DataError:
                return "Data Error"
            case .DecodingError:
                return "Decoding Error"
            }
        }
        
        var errorDescription: String? {
            switch self {
            case .URLError:
                return "Try checking your Url"
            case .NetworkError:
                return "Try checking your internet connection"
            case .ServerError:
                return "Server failed to return a valid reponse"
            case .DataError:
                return "Looks like the data is missing. oops!"
            case .DecodingError:
                return "Failed to Decode the response into your model"
            }
        }
    }
    
    static let shared = NetworkManger()
    
    let baseUrl = "https://api.github.com"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], NetworkError>) -> ()) {
        let endpoint = baseUrl + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.URLError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completion(.failure(.NetworkError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.ServerError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.DataError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.DecodingError))
            }
            
        }
        
        task.resume()
    }
}
