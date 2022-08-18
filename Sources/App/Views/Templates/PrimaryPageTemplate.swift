// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor

struct PrimaryPageTemplate: PageTemplate {
    static let title = "instruments.fyi"

    static func head(with page: Page) -> Node<HTML.DocumentContext> {
        .responsiveHead(
            .meta(
                .name("theme-color"),
                .content(Theme.dark.backgroundColor),
                .attribute(named: "media", value: "(prefers-color-scheme: dark)")
            ),
            .meta(
                .name("theme-color"),
                .content(Theme.light.backgroundColor),
                .attribute(named: "media", value: "(prefers-color-scheme: light)")
            ),
            .stylesheet("/styles/structure.css"),
            .stylesheet("/styles/primary.css"),
            .title("\(page.title) - \(self.title)")
            // .favicon("/images/favicon.png")
        )
    }

    static func body(with page: Page) -> Node<HTML.DocumentContext> {
        .body(
            .component(page.content)
        )
    }
}
