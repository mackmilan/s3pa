//
// Created by Andre Silva on 2019-08-06.
//

import Foundation
import Vapor

final class UserController: BaseController, RouteCollection {

    override required init(_ req: Request? = nil) {
        super.init(req)
    }

    func boot(router: Router) throws {
        let routes = router.grouped("ui", "user")
        routes.get("register", use: register)
    }

    func register(_ req: Request) throws -> Future<View> {
        self.createSession(req: req, context: "UserController")

        let viewContext = UserViewContext(session: try req.session(), dataModel: UserDataModel(nome: "", email: "", password: ""))

        return try req.view().render("user-register", viewContext)
    }

}