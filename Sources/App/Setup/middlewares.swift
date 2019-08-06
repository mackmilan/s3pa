//
// Created by Andre Silva on 2019-08-05.
//

import Vapor

public func middlewares(config: inout MiddlewareConfig) throws {

    config.use(FileMiddleware.self) // Serves files from `Public/` directory
    config.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    config.use(SessionsMiddleware.self) // Serves files from `Public/` directory

}