// Copyright © 2022 Brian Drelling. All rights reserved.

import PlotVapor
import Vapor
import VaporExtensions
import VaporSitemap

public struct InstrumentsAPI: AppConfiguring {
    // MARK: Initializers

    public init() {}

    // MARK: Methods

    public func configure(_ app: Application) throws {
        try self.configureRoutes(app)
    }

    private func configureRoutes(_ app: Application) throws {
        app.routes.caseInsensitive = true

        #warning("Rate-limit these endpoints!")
        try app.routes
            .grouped("api")
            .register(collection: RootController())
    }
}
