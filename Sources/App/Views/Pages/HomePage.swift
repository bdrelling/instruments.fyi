// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor
import Vapor

struct HomePage: TemplatedPage {
    let title = "Home"

    var content: Component {
        ComponentGroup {
            Div {
                Intro()

                // InstrumentsTable()

                Footer()
            }
            .class("container")
        }
    }
}

struct Intro: Component {
    var body: Component {
        Section {
            H1 {
                Text("Welcome to ")
                Span("instruments.fyi")
                    .class("name")
                Span(".")
            }

            Paragraph {
                Text("It's a super cool project, for instruments. Deployment worked!")
            }
        }
        .class("intro")
    }
}
