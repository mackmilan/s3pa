import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    try router.group(SessionsMiddleware.self) { router in

        router.get { req in
            try UIController().index(req)
        }

        // UI Routes
        try router.register(collection: UserController())

        // API Routes
        try router.register(collection: UserAPIController())
        try router.register(collection: SSEController())
        try router.register(collection: PollController())
    }
}
