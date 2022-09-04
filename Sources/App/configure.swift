// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor
import VaporExtensions

public func configure(_ app: Application) throws {
    // serve files from /Public folder
    let fileMiddleware = FileMiddleware(publicDirectory: app.directory.publicDirectory)
    app.middleware.use(fileMiddleware)

    // custom configuration
    try configureRedirectMiddleware(app)

    // configure routes
    try routes(app)
}

// MARK: - Supporting Methods

private func configureRedirectMiddleware(_ app: Application) throws {
    // redirects an array of valid hosts to a primary host
    switch app.environment {
    case .development, .production:
        app.middleware.use(HostRedirectMiddleware(
            primaryHost: "instruments.fyi",
            redirectedHosts: [
                "www.instruments.fyi",
            ]
        ))
    case .local:
        app.middleware.use(HostRedirectMiddleware(
            primaryHost: "instruments.local",
            redirectedHosts: [
                "www.instruments.local",
            ],
            port: 8080,
            scheme: .http
        ))
    default:
        throw ApplicationError.invalidEnvironment(app.environment)
    }
}
