import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(configuration: SQLPostgresConfiguration(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "taxi_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "taxi_password",
        database: Environment.get("DATABASE_NAME") ?? "taxi_database",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)
    
    //register migratins
    app.migrations.add(CreateOrder())
    app.migrations.add(CreateTest())
    app.logger.logLevel = .debug

    try app.autoMigrate().wait()
    // register routes
    try routes(app)
}
