// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import Vapor

public struct PrimaryNavbar: Component {
    public typealias Link = (text: String, url: String)

    public let links: [Link]

    public var body: Component {
        ComponentGroup {
            Navigation {
                Div {
                    for link in self.links {
                        Plot.Link(url: link.url) {
                            Text(link.text)
                        }
                    }
                }
                .class("horizontal-menu")

//                ThemeToggle()
            }
            .class("navbar")

//            ConstructionSign()
        }
    }

    public init(
        links: [Link] = [("Home", "/")]
    ) {
        self.links = links
    }
}
