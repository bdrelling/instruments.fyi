// Copyright © 2022 Brian Drelling. All rights reserved.

import InstrumentKit
import Vapor
import VaporExtensions

final class InstrumentController {
    private func instrument(req: Request) async throws -> View {
        guard let instrumentID = req.parameters.get(.instrumentID, as: String.self) else {
            throw Abort(.badRequest)
        }

        guard let instrument = StringInstrument.allCases.first(where: { $0.id == instrumentID }) else {
            throw Abort(.notFound)
        }

        return try await req.plot.render(InstrumentPage(instrument: instrument))
    }
}

// MARK: - Supporting Types

private extension PathParameter {
    static let instrumentID: Self = "instrumentID"
}

// MARK: - Extensions

extension InstrumentController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(.parameter(.instrumentID), use: self.instrument)
    }
}
