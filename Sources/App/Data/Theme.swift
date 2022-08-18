// Copyright © 2022 Brian Drelling. All rights reserved.

struct Theme {
    var backgroundColor: String
}

// MARK: - Convenience

extension Theme {
    static let dark: Self = .init(
        backgroundColor: "#000000"
    )

    static let light: Self = .init(
        backgroundColor: "#ffffff"
    )
}
