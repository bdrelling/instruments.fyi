// Copyright © 2022 Brian Drelling. All rights reserved.

import InstrumentKit
import Plot
import PlotVapor
import Vapor

struct HomePage: TemplatedPage {
    let title = "Home"

    var body: Component {
        Div {
            Intro()

            InstrumentTable(instruments: StringInstrument.allCases)

            PrimaryFooter()
        }
        .class("container")
    }
}
