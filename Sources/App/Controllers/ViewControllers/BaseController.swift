//
// Created by Andre Silva on 2019-08-05.
//

import Foundation
import Vapor

open class BaseController: NSObject {

    var req: Request?

    public required init(_ req: Request?) {
        super.init()

        self.req = req
    }

    subscript(dynamicMember member: String) -> Void {
        switch (member) {
        default:
            break
        }
    }

}