// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor
import Structure

public struct DefaultTemplate: Template {
    public static func head(with page: Page) -> Component {
        DefaultHeadContent(page: page)
        page.head
    }

    public static func body(with page: Page) -> Component {
        Div {
            DefaultNavbar(page: page)
            page.body
            SimpleFooter()
        }
        .class("container")
    }

    public static func scripts(with page: Page) -> Component {
        page.scripts
    }
}

// MARK: - Extensions

public extension TemplatedPage {
    // Set this template as the default for all templated pages within this module.
    typealias Template = DefaultTemplate
}
