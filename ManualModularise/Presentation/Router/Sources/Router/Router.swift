import RouterAPI
import SwiftUI

//public class Router: Routing {
//    public init() {}
//    
//    public var registeredRoutes: [Route] = []
//    
//    public func register(route: Route) {
//        guard registeredRoutes.filter({ $0.path == route.path }).first == nil else { return }
//        registeredRoutes.append(route)
//    }
//    
//    public func resolve(path: String, params: [Any]?) -> any View {
//        guard let route = registeredRoutes.first(where: { $0.path == path }) else {
//            fatalError("Cannot find route with path: \(path)")
//        }
//        return route.render(params: params)
//    }
//}

public typealias DictionaryPayload = [String: Any]

public protocol NavigationViewModule {
}

public class SwiftUIViewModule : NavigationViewModule {
    
    public var viewMethod: (DictionaryPayload?) -> any View
    
    public init(view: @escaping (DictionaryPayload?) -> any View) {
        viewMethod = view
    }
    
    public func releaseView(params: [String: Any]?) -> some View{
        return AnyView(viewMethod(params))
    }
}


public class Router: ObservableObject {
    var dictionaryViews: [AnyHashable: NavigationViewModule] = [:]
    
    @Published public var navPath: NavigationPath
    
    public init() {
        navPath = NavigationPath()
    }
    
    public func addView(id: AnyHashable, view: NavigationViewModule) {
        dictionaryViews[id] = view
    }
    
    public func deliveryView(viewId: AnyHashable, params: DictionaryPayload? = nil) -> some View {
        return (self.dictionaryViews[viewId] as? SwiftUIViewModule)?.releaseView(params: params)
    }
    
    public func navigate(to destination: any Hashable) {
        navPath.append(destination)
    }
    
    public func finishFlow() {
        navPath.removeLast(navPath.count)
    }
    
    public func navigateBack() {
        if navPath.count > 0 {
            navPath.removeLast()
        }
    }
}
