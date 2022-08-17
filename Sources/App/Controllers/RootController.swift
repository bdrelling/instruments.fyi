// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

final class RootController: RouteCollection {
    private let application: Application

    init(app application: Application) {
        self.application = application
    }

    func boot(routes: RoutesBuilder) throws {
        try routes
            .register(collection: HomeController())

        try routes
            .grouped("status")
            .register(collection: StatusController())

        try routes
            .grouped("api")
            .grouped("instruments")
            .register(collection: InstrumentController())
    }
}
