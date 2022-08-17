// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

struct StatusController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("") { _ in
            true
        }
    }
}
