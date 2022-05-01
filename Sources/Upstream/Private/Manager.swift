//
//  File.swift
//  
//
//  Created by Mohammad Yasir on 01/05/22.
//

import UIKit

extension Upstream {
    struct iTuneApiManager {
        static func getVersion(appID: String, completion: @escaping (Result<iTuneResponseModel, NetworkError>) -> ()) -> Void {
            
            let url = "https://itunes.apple.com/lookup?id=\(appID)"
            
            guard let safeURL = URL(string: url) else {
                completion(.failure(.wrongURL))
                return
            }
            
            var request = URLRequest(url: safeURL)
            request.httpMethod = "GET"
            
            let session = URLSession(configuration: .default)
            
            session.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    completion(.failure(.timeOut))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(iTuneResponseModel.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.dataNotFound))
                }
                
            }
            .resume()
        }
    }
}

