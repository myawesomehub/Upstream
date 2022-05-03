## What is Upstream?

It gives you a **magic** button, because this button will **only appear** when there is an app **update available** on appstore for **given app**. 

<img src="https://github.com/myawesomehub/Upstream/blob/main/Asset/updateButton.png">

Place this button anywhere you wish. Best location is to place it on trailing navigation bar item.

## How to use it?
- Import this library as swift package in your project.
- Get the app Id from app store connect for your app. [Tutorial](https://github.com/myawesomehub/Upstream/blob/main/Asset/GetAppleIdForApp.png)
- Follow the below snippet

```swift
import SwiftUI
import Upstream

struct ContentView: View {
    var body: some View {
        UpstreamButton(.init(appId: "1618653423"), showFeatureSheet: false)
    }
}
```

## License

Upstream is licensed under the [MIT License](https://github.com/myawesomehub/Upstream/blob/main/LICENSE).

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/mohdYasir03)
