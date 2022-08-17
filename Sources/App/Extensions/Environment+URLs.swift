// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

extension Environment {
    var baseURL: String {
        switch self {
        case .production:
            return "https://www.instruments.fyi"
        case .development:
            return "https://dev.instruments.fyi"
        case .local:
            return "http://localhost:8080"
        default:
            return Self.production.baseURL
        }
    }

    var apiURL: String {
        "\(self.baseURL)/api"
    }
}
