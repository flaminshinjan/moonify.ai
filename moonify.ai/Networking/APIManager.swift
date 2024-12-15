//
//  APIManager.swift
//  moonify.ai
//
//  Created by Shinjan Patra on 15/12/24.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
 
    
    func fetchMoonData(lat: Double, lon: Double, completion: @escaping (Result<MoonResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/advanced?lat=\(lat)&lon=\(lon)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "X-Rapidapi-Key")
        request.addValue("moon-phase.p.rapidapi.com", forHTTPHeaderField: "X-Rapidapi-Host")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            do {
                let moonResponse = try JSONDecoder().decode(MoonResponse.self, from: data)
                completion(.success(moonResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
