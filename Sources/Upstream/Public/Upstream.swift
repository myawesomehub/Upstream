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

import SwiftUI

public struct UpstreamButton: View {
    @ObservedObject private var upstream: Upstream
    public var showFeatureSheet: Bool

    public init(_ upstream: Upstream, showFeatureSheet: Bool) {
        self.upstream = upstream
        self.showFeatureSheet = showFeatureSheet
    }

    public var body: some View {
        VStack {
            switch upstream.updateStatus {
            case .updateNotAvailable:
                EmptyView()
            case .updateAvailable:
                Button {
                    if showFeatureSheet {
                        upstream.showUpstreamView = true
                    } else {
                        if let url = URL(string: upstream.data.trackViewUrl) {
                            UIApplication.shared.open(url)
                        }
                    }
                } label: {
                    Text("UPDATE")
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(Color.hexValue("#EEEEEF"))
                        .cornerRadius(12)
                }

            }
        }
        .sheet(isPresented: $upstream.showUpstreamView) {
            UpstreamView(upstream: upstream)
        }
    }
}
