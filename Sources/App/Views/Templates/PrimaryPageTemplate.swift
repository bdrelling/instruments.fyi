// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor

struct DefaultTemplate: Template {
    static let title = "instruments.fyi"

    public static func head(with page: Page) -> Component {
        DefaultHeadContent(
            title: (page as? TemplatedPage)?.title,
            canonicalURL: (page as? TemplatedPage)?.canonicalURL
        )
        page.head
    }

    public static func body(with page: Page) -> Component {
        page.body
    }
}

// MARK: - Extensions

extension TemplatedPage {
    // Set this template as the default for all templated pages within this module.
    typealias Template = DefaultTemplate
}
