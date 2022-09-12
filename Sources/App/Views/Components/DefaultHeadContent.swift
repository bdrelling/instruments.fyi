// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor

public struct DefaultHeadContent: Component {
    public let title: String?
    public let canonicalURL: String?

    public var body: Component {
        ComponentGroup {
            // Charset
            Meta(charset: .utf8)
            // Responsiveness
            Meta(name: "viewport", content: "width=device-width, initial-scale=1")
            // Title
            if let title = self.title {
                Title(title)
            }
            // Canonical URL
            if let canonicalURL = self.canonicalURL {
                HeadLink(canonicalURL, relationship: .canonical)
            }
            // Theme Color
            Meta(themeColor: Theme.dark.backgroundColor, colorScheme: "dark")
            Meta(themeColor: Theme.light.backgroundColor, colorScheme: "light")
            // Stylesheets
            StyleSheet("/styles/structure.css")
            StyleSheet("/styles/primary.css")
        }
    }

    init(title: String? = nil, canonicalURL: String? = nil) {
        self.title = title
        self.canonicalURL = canonicalURL
    }
}
