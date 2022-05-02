## What is Upstream?

Upstream allows you to play with the information you have on appstore for your app.

## Features
- [x] Get app update status of your app. `case sameVersion` and `case notSameVersion`

## How to use it?

- Add it as a swift package in your project.
- Get the apple id of your app from app store connect. [Check how to get](https://github.com/myawesomehub/Upstream/blob/main/Asset/GetAppleIdForApp.png)
- Get the version information as mentioned below:

```swift
private let upstream: Upstream = .init()

private func getStatus() -> Void {
    
    let appID: String = "YOUR APP ID"
    
    upstream.fetchStatus(appID: appID) { status in
        switch status {
        case .sameVersion(let version):
            print("Current app and appstore version is same as \(version)")
        case .notSameVersion(let appstoreVersion, let localAppVersion):
            print("Current app and appstore version is not same. On Appstore: \(appstoreVersion) and local is: \(localAppVersion)")
        case .failed(let error):
            print("Failed with error: \(error.localizedDescription)")
        }
    }
}

```
