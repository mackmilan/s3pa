//
// Created by Andre Silva on 2019-08-06.
//

import Foundation
import Vapor

final class UserAPIController: RouteCollection {

    func boot(router: Router) throws {
        let routes = router.grouped("api", "user")
        routes.post(UserRequest.self, use: add)
    }

    func add(_ req: Request, content: UserRequest) throws -> Response {
        print(content)

        let response = req.makeResponse()

        return response
    }

}