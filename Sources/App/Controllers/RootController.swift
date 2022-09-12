// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

final class RootController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        // Status
        try routes.grouped("status").register(collection: StatusController())

        // Website
        try routes.register(collection: HomeController())

        // API
        #warning("Rate-limit these endpoints!")
        try routes
            .grouped("api")
            .grouped("instruments")
            .register(collection: InstrumentController())
    }
}
