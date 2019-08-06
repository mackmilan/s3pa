import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    try router.group(SessionsMiddleware.self) { router in

        router.get { req in
            try UIController().index(req)
        }

        try router.register(collection: SSEController())
        try router.register(collection: PollController())
    }
}
