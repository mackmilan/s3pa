//
// Created by Andre Silva on 2019-08-05.
//

import Foundation
import Vapor

public class UIButton: UIElement {

    override public init(id: String) {
        super.init(id: id)
    }

//    public subscript(dynamicMember member: String) -> Void {
//        switch (member) {
//        case "onClick":
//            self.onClick()
//        default:
//            break
//        }
//    }

    public func onClick(action: () throws -> ()) {
        print("Button onClick")
        try? action()
    }

}

public class UIElement: NSObject {

    public var id: String

    public init(id: String) {
        self.id = id
    }

}