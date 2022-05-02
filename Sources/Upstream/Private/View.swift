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
//  View.swift
//  
//
//  Created by Mohammad Yasir on 02/05/22.
//

import SwiftUI

extension UpstreamButton {
    public struct UpstreamView: View {
        @ObservedObject private var upstream: Upstream
        
        public init(upstream: Upstream) {
            self.upstream = upstream
        }
        
        public var body: some View {
            VStack(alignment: .leading) {
                   
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 30) {
                        component(header: "What's New?", text: upstream.data.releaseNotes)
                        
                        component(header: "Description", text: upstream.data.description)
                    }
                }

                Spacer()
                
                Button {
                    if let url = URL(string: upstream.data.trackViewUrl) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 50)
                            .foregroundColor(.blue)
                        
                        Text("Update Now")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                
            }
            .padding(24)
            .background(Color.black.ignoresSafeArea(.all, edges: .all))
        }
        
        private func component(header: String, text: String) -> some View {
            VStack(alignment: .leading, spacing: 18) {
                Text(header)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                Text(text)
                    .font(.body)
                    .padding(12)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                 
            }
        }
    }
}
