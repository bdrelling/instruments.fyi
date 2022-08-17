// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

extension Environment {
    static let local: Self = .custom(name: "local")
}
