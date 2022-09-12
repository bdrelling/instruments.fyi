// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor

public struct DefaultHeadContent: Component {
    public let siteTitle: String
    public let pageTitle: String?
    public let canonicalURL: String?

    public var body: Component {
        ComponentGroup {
            // Charset
            Meta(charset: .utf8)
            // Responsiveness
            Meta(name: "viewport", content: "width=device-width, initial-scale=1")
            // Title
            if let pageTitle = self.pageTitle {
                Title("\(pageTitle) - \(self.siteTitle)")
            } else {
                Title(self.siteTitle)
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
            StyleSheet("/styles/components.css")
        }
    }

    init(siteTitle: String, pageTitle: String? = nil, canonicalURL: String? = nil) {
        self.siteTitle = siteTitle
        self.pageTitle = pageTitle
        self.canonicalURL = canonicalURL
    }
}
