//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerUrl = baseUrl + "appetizers"
    
    private init() {

    }
    
    func getAppetizers(completed: @escaping (Result<[AppetizerModel], APError>) -> Void) {
        
        guard let url = URL(string: appetizerUrl) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { data, response, error in
            
            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
                
            } catch {
                completed(.failure(.invalidData))
            }
        })
        
        task.resume()
    }
    
    func getAppetizersAsync() async throws -> [AppetizerModel] {
        
        guard let url = URL(string: appetizerUrl) else {
            throw APError.invalidUrl
        }
    
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        } catch {
            throw APError.invalidData
        }
    }
    
    func downloadImage(fromURLString urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            completion(image)
        }
        
        task.resume()
    }
}
