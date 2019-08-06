//
// Created by Andre Silva on 2019-08-03.
//

import Foundation
import Vapor

@objc(UIController)
final class UIController: BaseController {

    var button: UIButton = UIButton(id: "button")

    override required init(_ req: Request? = nil) {
        super.init(req)
    }

    override subscript(dynamicMember member: String) -> Void {
        switch (member) {
        case "button":
            self.button.onClick(action: { () -> Void in
                print(try self.req?.session()["uuid"])
            })
        default:
            break
        }
    }

    func index(_ req: Request) throws -> Future<View> {
        let uuid = UUID().uuidString
        try req.session()["uuid"] = uuid
        try req.session()["context"] = "UIController"

        return try req.view().render("index", UIViewContext(uuid: uuid, context: "UIController"))
    }

}
