// Copyright © 2022 Brian Drelling. All rights reserved.

import PlotVapor
import Vapor
import VaporExtensions
import VaporSitemap

public struct InstrumentsApp: ApplicationDelegate {
    // MARK: Shared Instance

    public static let shared = try! InstrumentsApp()

    // MARK: Properties

    public let app: Application

    var baseURL: String {
        self.app.environment.baseURL
    }

    // MARK: Initializers

    public init(_ app: Application) {
        self.app = app
    }

    // MARK: Methods

    public func configure(_ app: Application) throws {
        // serve files from /Public folder
        let fileMiddleware = FileMiddleware(publicDirectory: app.directory.publicDirectory)
        app.middleware.use(fileMiddleware)

        try self.configureRedirectMiddleware(app)
        try self.configureSitemapMiddleware(app)
        try self.configureRoutes(app)
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

    private func configureSitemapMiddleware(_ app: Application) throws {
        // creates a dynamic sitemap
        app.middleware.use(SitemapMiddleware(
            isSitemap: { req in
                // Whether or not the middleware should handle the path.
                req.url.path == "/sitemap.xml"
            }, generateURLs: { req in
                let paths = [
                    "",
                    // "about",
                ]

                return paths.map { path in
                    "\(app.environment.baseURL)/\(path)"
                }

                .map(SitemapURL.init)
            }
        ))
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
    }
}
