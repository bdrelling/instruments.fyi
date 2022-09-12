// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor

public struct SplashTemplate: Template {
    public static let title = DefaultTemplate.title

    public static func head(with page: Page) -> Component {
        DefaultHeadContent(
            title: (page as? TemplatedPage)?.title,
            canonicalURL: (page as? TemplatedPage)?.canonicalURL
        )
    }

    public static func body(with page: Page) -> Component {
        Div {
            Div(
                page.body
            )
            .class("splash")
        }
        .class("container")
    }
}
