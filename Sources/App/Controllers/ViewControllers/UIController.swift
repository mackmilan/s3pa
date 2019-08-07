//
// Created by Andre Silva on 2019-08-03.
//

import Foundation
import Vapor

final class UIController: BaseController, RouteCollection {

    override required init(_ req: Request? = nil) {
        super.init(req)
    }

    func boot(router: Router) throws {
        let uiRoutes = router.grouped("ui")
        uiRoutes.get("", use: index)

        let controllerRoutes = uiRoutes.grouped("UIController")
        controllerRoutes.post(PollRequest.self, at: "button", use: button)
    }

    func index(_ req: Request) throws -> Future<View> {
        self.createSession(req: req, context: "UIController")

        let viewContext = UIViewContext(session: try req.session(), dataModel: UIDataModel())

        return try req.view().render("index", viewContext)
    }

    func button(_ req: Request, content: PollRequest) throws -> Response {
        let response = req.makeResponse()

        return response
    }

}
