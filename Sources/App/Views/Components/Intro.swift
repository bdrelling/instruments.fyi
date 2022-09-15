// Copyright © 2022 Brian Drelling. All rights reserved.

import InstrumentKit
import Plot
import PlotVapor
import Structure
import Vapor

struct Intro: Component {
    private let stats = StringInstrument.allCases.stats

    var body: Component {
        Section {
            H1("instruments.fyi")

            Paragraph {
                MarkdownText("""
                There are currently **\(self.stats.numberOfInstruments) instruments** representing **\(self.stats.numberOfCountries) countries**,
                with a total of **\(self.stats.numberOfTunings) tunings**.
                """)
            }

            Paragraph(self.stats.countries.map(\.flag).joined(separator: " "))
        }
        .class("intro")
    }
}
