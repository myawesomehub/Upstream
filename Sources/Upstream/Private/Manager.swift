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
//  Manager.swift
//  
//
//  Created by Mohammad Yasir on 02/05/22.
//

import SwiftUI

extension UpstreamButton {
    public class Upstream: ObservableObject {
        
        @Published public var data: ResultResponse = .init()
        @Published public var showUpstreamView: Bool = false
        @Published public var updateStatus: UpdateStatus = .updateNotAvailable
        
        public init(appId: String) {
            fetchStatus(appID: appId)
        }
        
        public func fetchStatus(appID: String) -> Void {
            iTuneApiManager.getAppInformation(appID: appID) { result in
                switch result {
                case .success(let data):
                    if let data = data.results.first {
                        if data.version != UIApplication.appVersion {
                            DispatchQueue.main.async {
                                self.updateStatus = .updateAvailable
                                self.data = data
                            }
                        }
                    }
                    print("Data:", data)
                case .failure(let error):
                    print("ERRORR: ", error.localizedDescription)
                }
            }
        }
    }
}
