// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

final class RootController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        try routes.grouped("instruments").register(collection: InstrumentController())
    }
}
