// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

public func configure(_ app: Application) throws {
    // serve files from /Public folder
    let fileMiddleware = FileMiddleware(publicDirectory: app.directory.publicDirectory)
    app.middleware.use(fileMiddleware)

    // configure routes
    try routes(app)
}
