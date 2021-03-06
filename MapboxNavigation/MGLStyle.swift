import Foundation
import Mapbox

extension MGLStyle {
    // The Mapbox China Day Style URL.
    static let mapboxChinaDayStyleURL = URL(string:"mapbox://styles/mapbox/streets-zh-v1")!
    
    // The Mapbox China Night Style URL.
    static let mapboxChinaNightStyleURL = URL(string:"mapbox://styles/mapbox/dark-zh-v1")!
    
    /**
     Returns the URL to the current version of the Mapbox Navigation Day style.
     */
    public class var navigationDayStyleURL: URL {
        get {
            if(MGLAccountManager.hasChinaBaseURL){
                return mapboxChinaDayStyleURL
            }
            return URL(string:"mapbox://styles/mapbox-map-design/ckd6dqf981hi71iqlyn3e896y")!
        }
    }
    
    /**
     Returns the URL to the current version of the Mapbox Navigation Night style.
     */
    public class var navigationNightStyleURL: URL {
        get {
            if(MGLAccountManager.hasChinaBaseURL){
                return mapboxChinaDayStyleURL
            }
            return URL(string:"mapbox://styles/mapbox-map-design/ckd6dnz2q0m0q1io1mssumxqd")!
        }
    }
    
    /**
     Returns the URL to the given version of the navigation guidance style. Available version are 1, 2, 3, and 4.
     
     We only have one version of navigation guidance style in China, so if you switch your endpoint to .cn, it will return the default day style.
     */
    public class func navigationGuidanceDayStyleURL(version: Int) -> URL {
        if(MGLAccountManager.hasChinaBaseURL){
            return mapboxChinaDayStyleURL
        }
        return URL(string:"mapbox://styles/mapbox/navigation-guidance-day-v\(version)")!
    }
    
    /**
     Returns the URL to the given version of the navigation guidance style. Available version are 2, 3, and 4.
     
     We only have one version of navigation guidance style in China, so if you switch your endpoint to .cn, it will return the default night style.
     */
    public class func navigationGuidanceNightStyleURL(version: Int) -> URL {
        if(MGLAccountManager.hasChinaBaseURL){
            return mapboxChinaNightStyleURL
        }
        return URL(string: "mapbox://styles/mapbox/navigation-guidance-night-v\(version)")!
    }
    
    /**
     Returns the URL to the given version of the Mapbox Navigation Preview Day style. Available versions are 1, 2, 3, and 4.
     
     We only have one version of Navigation Preview style in China, so if you switch your endpoint to .cn, it will return the default day style.
     */
    public class func navigationPreviewDayStyleURL(version: Int) -> URL {
        if MGLAccountManager.hasChinaBaseURL {
            return mapboxChinaDayStyleURL
        }
        return URL(string:"mapbox://styles/mapbox/navigation-guidance-day-v\(version)")!
    }
    
    /**
     Returns the URL to the given version of the Mapbox Navigation Preview Night style. Available versions are 2, 3, and 4.
     
     We only have one version of Navigation Preview style in China, so if you switch your endpoint to .cn, it will return the default night style.
     */
    public class func navigationPreviewNightStyleURL(version: Int) -> URL {
        if MGLAccountManager.hasChinaBaseURL {
            return mapboxChinaNightStyleURL
        }
        return URL(string: "mapbox://styles/mapbox/navigation-guidance-night-v\(version)")!
    }
    
    /**
     Remove the given style layers from the style in order.
     */
    func remove(_ layers: [MGLStyleLayer]) {
        for layer in layers {
            removeLayer(layer)
        }
    }
    
    /**
     Remove the given sources from the style.
     
     Only remove a source after removing all the style layers that use it.
     */
    func remove(_ sources: Set<MGLSource>) {
        for source in sources {
            removeSource(source)
        }
    }
}
