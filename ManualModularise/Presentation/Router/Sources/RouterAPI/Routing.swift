import Foundation
import SwiftUI

//public protocol Routing: ObservableObject {
//    var registeredRoutes: [Route] { get set }
//    
//    func register(route: Route)
//    
//    func resolve(path: String, params: [Any]?) -> any View
//}
//
//public protocol NavigationViewModule {
//}
//
//public class SwiftUIViewModule : NavigationViewModule {
//    
//    public var viewMethod: ([Any]?) -> any View
//    
//    public init(view: @escaping ([Any]?) -> any View) {
//        viewMethod = view
//    }
//    
//    public func releaseView(params: [Any]?) -> some View{
//        return AnyView(viewMethod(params))
//    }
//}
//
//public protocol Routing: ObservableObject {
//    var dictionaryViews: [AnyHashable: NavigationViewModule]
//    
//    var navPath: NavigationPath { get set }
//    
//    init()
//    
//    func addView(id: AnyHashable, view: NavigationViewModule)
//    
//    public func deliveryView(viewId: AnyHashable, params: [Any]? = nil) -> some View
//    
//    public func navigate(to destination: any Hashable)
//    
//    public func finishFlow()
//    
//    public func navigateBack()
//}
