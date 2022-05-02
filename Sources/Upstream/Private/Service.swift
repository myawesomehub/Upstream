// MIT License

// Copyright (c) 2022 Mohammad Yasir

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//  Service.swift
//  
//
//  Created by Mohammad Yasir on 02/05/22.
//

import SwiftUI

public extension UpstreamButton.Upstream {
    struct iTuneApiManager {
        static func getAppInformation(appID: String, completion: @escaping (Result<iTuneResponse, iTuneApiFailure>) -> ()) -> Void {
            
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
                    let decodedData = try decoder.decode(iTuneResponse.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.dataNotFound))
                }
                
            }
            .resume()
        }
    }
}
