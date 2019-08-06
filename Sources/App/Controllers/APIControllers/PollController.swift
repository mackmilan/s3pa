//
// Created by Andre Silva on 2019-08-03.
//

import Foundation
import Vapor

final class PollController: RouteCollection {

    func boot(router: Router) throws {
        let pollRoutes = router.grouped("s3pa", "poll")
        pollRoutes.post(PollRequest.self, use: index)
    }

    func index(_ req: Request, content: PollRequest) throws -> Response {
        let s = try req.session()
        let response = try PollResponse(uuid: s["uuid"]!, context: s["context"]!)

        let controllerRef = NSClassFromString(s["context"]!) as! BaseController.Type
        let controllerIns = controllerRef.init(req)
        controllerIns[dynamicMember: content.source]

        let res = req.makeResponse()
        res.http.body = HTTPBody(string: try String(data: response.encode(), encoding: .utf8)!)
        return res
    }

}