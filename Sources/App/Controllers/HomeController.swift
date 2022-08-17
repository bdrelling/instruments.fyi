// Copyright © 2022 Brian Drelling. All rights reserved.

import InstrumentKit
import Vapor

final class HomeController {
    private func home(req: Request) async throws -> String {
        "No frontend just yet! Visit \(req.application.environment.apiURL)/instruments to check out the API."
    }
}

// MARK: - Extensions

extension HomeController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("", use: self.home)
    }
}
