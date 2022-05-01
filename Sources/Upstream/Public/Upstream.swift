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

import UIKit

public class Upstream {
    
    public init() { }
    
    public func fetchStatus(completion: @escaping (Status) -> ()) -> Void {
        iTuneApiManager.getVersion(appID: "1618653423") { result in
            switch result {
            case .success(let data):
                guard let appstoreAppVersion = data.results.first?.version else {
                    completion(.failed(NetworkError.dataNotFound))
                    return
                }
                
                let localAppVersion = UIApplication.appVersion
                
                if appstoreAppVersion == localAppVersion {
                    completion(.sameVersion(version: appstoreAppVersion))
                } else {
                    completion(.notSaveVersion(appstoreVersion: localAppVersion, localAppVersion: appstoreAppVersion))
                }
            case .failure(let error):
                completion(.failed(error))
            }
        }
    }
}
