// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor
import Vapor

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
                Text("It's a super cool project, for instruments.")
            }
        }
        .class("intro")
    }
}
