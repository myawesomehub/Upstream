## What is Upstream?

Get the **app version** information from **appstore** for your app. 

## How to use it?

- Add it as a swift package in your project.
- Get the apple id of your app from app store connect. [Check how to get](https://github.com/myawesomehub/Upstream/blob/main/Asset/GetAppleIdForApp.png)
- Get the version information as mentioned below:

```swift
private let upstream: Upstream = .init()

private func getStatus() -> Void {
    
    let appID: String = "YOUR APPID"
    
    upstream.fetchStatus(appID: appID) { status in
        switch status {
        case .sameVersion(let version):
            print("Current app and appstore version is same as \(version)")
        case .notSaveVersion(let appstoreVersion, let localAppVersion):
            print("Current app and appstore version is not same. On Appstore: \(appstoreVersion) and local is: \(localAppVersion)")
        case .failed(let error):
            print("Failed with error: \(error.localizedDescription)")
        }
    }
}

```
