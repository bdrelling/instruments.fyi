// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor

struct DefaultTemplate: Template {
    static let title = "instruments.fyi"

    public static func head(with page: Page) -> Component {
        DefaultHeadContent(
            siteTitle: self.title,
            pageTitle: (page as? TemplatedPage)?.title,
            canonicalURL: (page as? TemplatedPage)?.canonicalURL
        )
        page.head
    }

    public static func body(with page: Page) -> Component {
        page.body
    }

//    private static func title(for page: Page) -> String {
//        if let pageTitle = (page as? TemplatedPage)?.title {
//            return "\(pageTitle) - \(self.title)
//        } else {
//            return self.title
//        }
//    }
}

// MARK: - Extensions

extension TemplatedPage {
    // Set this template as the default for all templated pages within this module.
    typealias Template = DefaultTemplate
}
