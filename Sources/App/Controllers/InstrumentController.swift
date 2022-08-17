// Copyright © 2022 Brian Drelling. All rights reserved.

import InstrumentKit
import Vapor

final class InstrumentController {
    private func instruments(req: Request) async throws -> [StringInstrument] {
        do {
            let locale: String = try req.query.get(at: Parameter.locale.rawValue)

            return .allCases.localized(to: locale)
        } catch {
            // In the event a localization string is not provided,
            // instead of throwing an error, simply return the default (English) localization.
            return .allCases
        }
    }
}

// MARK: - Supporting Types

private extension InstrumentController {
    enum Parameter: String {
        case locale
    }
}

// MARK: - Extensions

extension InstrumentController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("", use: self.instruments)
    }
}

extension StringInstrument: Content {}
