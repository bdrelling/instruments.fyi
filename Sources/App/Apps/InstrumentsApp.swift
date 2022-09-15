// Copyright © 2022 Brian Drelling. All rights reserved.

import API
import PlotVapor
import Structure
import Vapor

public struct InstrumentsApp: ApplicationDelegate {
    // MARK: Shared Instance

    public static let shared = try! InstrumentsApp()

    // MARK: Properties

    public let app: Application

    var baseURL: String {
        self.app.environment.baseURL
    }

    private let subApps: [AppConfiguring] = [
        InstrumentsAPI(),
    ]

    // MARK: Initializers

    public init(_ app: Application) {
        self.app = app
    }

    // MARK: Methods

    public func configure(_ app: Application) throws {
        app.servePublicFiles()
        app.enableStructureCDN()

        try self.configureRedirectMiddleware(app)
        try self.configureRoutes(app)

        self.configureSitemap(app)

        // configure each of our sub-applications
        try self.subApps.forEach { try $0.configure(app) }
    }

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
                    "localhost",
                    "127.0.0.1",
                ],
                port: 8080,
                scheme: .http
            ))
        default:
            throw ApplicationError.invalidEnvironment(app.environment)
        }
    }

    private func configureSitemap(_ app: Application) {
        app.configureSitemap(baseURL: app.environment.baseURL, paths: [
            "",
        ])
    }

    private func configureRoutes(_ app: Application) throws {
        app.routes.caseInsensitive = true

        // Create a catchall "Page Not Found" route.
        app.get("**") { req -> View in
            if let errorPage = ErrorPage(.notFound) {
                return try await req.plot.render(errorPage)
            } else {
                throw Abort(.notFound)
            }
        }

        try app.register(collection: RootController())

        // Set our global JSON encoder for all routes to sort keys.
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]

        // override the global encoder used for the `.json` media type
        ContentConfiguration.global.use(encoder: encoder, for: .json)
    }
}
