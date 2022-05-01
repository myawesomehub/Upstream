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
