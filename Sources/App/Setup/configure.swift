import Leaf
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    // Register providers first
    try services.register(LeafProvider())

    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
    services.register { container -> LeafTagConfig in
        var config = LeafTagConfig.default()
        config.use(SessionTag(), as: "session")
        config.use(UUIDTag(), as: "uuid")
        return config
    }

    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Register middleware
    var middlewaresConfig = MiddlewareConfig()
    try middlewares(config: &middlewaresConfig)
    services.register(middlewaresConfig)

    // Register the configured SQLite database to the database config.
    var databasesConfig = DatabasesConfig()
    try databases(config: &databasesConfig)
    services.register(databasesConfig)

    setupRepositories(services: &services, config: &config)
}
