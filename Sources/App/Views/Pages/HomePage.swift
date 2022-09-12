// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor
import Vapor

struct HomePage: TemplatedPage {
    let title = "Home"

    var body: Component {
        ComponentGroup {
            Div {
                Intro()

                // InstrumentsTable()

                PrimaryFooter()
            }
            .class("container")
        }
    }
}
