//
//  NetworkManager.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/12/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class NetworkManger {
    
    enum NetworkError: LocalizedError {
        case URLError
        case NetworkError
        case ServerError
        case DataError
        case DecodingError
        case ImageError
        
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
            case .ImageError:
                return "Image Error"
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
            case .ImageError:
                return "Failed to convert to data to UIImage"
            }
        }
    }
    
    static let shared = NetworkManger()
    
    private let baseUrl = "https://api.github.com"
    
    let cache = NSCache<NSString, UIImage>()
    
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
    
    func getImage(from urlString: String, completion: @escaping (Result<UIImage, NetworkError>) -> ()) {
        
        if let image = cache.object(forKey: NSString(string: urlString)) {
            completion(.success(image))
            return
        }
        
        guard let url = URL(string: urlString) else {
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

            if let image = UIImage(data: data) {
                self.cache.setObject(image, forKey: NSString(string: urlString))
                DispatchQueue.main.async { completion(.success(image)) }
            } else {
                completion(.failure(.ImageError))
            }
        }
        
        task.resume()
    }
    
}
