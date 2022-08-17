// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

func routes(_ app: Application) throws {
    app.routes.caseInsensitive = true

    try app.register(collection: RootController(app: app))
}
