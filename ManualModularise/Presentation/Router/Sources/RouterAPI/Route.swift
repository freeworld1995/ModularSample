import SwiftUI

public struct Route {
    public let path: String
    public let destination: ([Any]?) -> any View
    
    public init(path: String, destination: @escaping ([Any]?) -> any View) {
        self.path = path
        self.destination = destination
    }
    
    public func render(params: [Any]?) -> some View {
        AnyView(destination(params))
    }
}
