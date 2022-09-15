// Copyright © 2022 Brian Drelling. All rights reserved.

import InstrumentKit
import Plot
import PlotVapor
import Vapor

struct InstrumentPage: TemplatedPage {
    private let instrument: StringInstrument

    var title: String {
        self.instrument.name
    }

    var body: Component {
        Section {
            H2(self.instrument.name)

            Div {
                Header("Strings")
                Span(String(self.instrument.numberOfStrings))
            }
            .class("row")

            Div {
                Header("Courses")
                Span(String(self.instrument.numberOfCourses))
            }
            .class("row")

            Div {
                Header("Classification")
                    .class("help-text")
                    .attribute(named: "title", value: "Hornbostel-Sachs Classification")
                Span(self.instrument.classification.rawValue)
            }
            .class("row")

            Div {
                Header("Standard Tuning")
                if let standardTuning = self.instrument.standardTuning {
                    Span(standardTuning.notes.description)
                } else {
                    Span("n/a")
                        .class("muted")
                }
            }
            .class("row")

            Div {
                Header("Alternate Tunings")

                if !self.instrument.alternateTunings.isEmpty {
                    for tuning in self.instrument.alternateTunings {
                        Div(tuning.description)
                    }
                } else {
                    Span("Unknown")
                        .class("muted")
                }
            }
            .class("row")

            Div {
                Header("Countries")

                if !self.instrument.countries.isEmpty {
                    for country in self.instrument.countries {
                        Span(country.flag)
                            .attribute(named: "title", value: country.localizedName(locale: self.instrument.locale))
                    }
                } else {
                    Span("Unknown")
                        .class("muted")
                }
            }
            .class("row")

            Div {
                Header("Year")

                if let year = self.instrument.year {
                    Span(String(year))
                } else {
                    Span("Unknown")
                        .class("muted")
                }
            }
            .class("row")

            if !self.instrument.resources.isEmpty {
                Div {
                    Header("Additional Resources")

                    for resource in self.instrument.resources {
                        Link(url: resource.url) {
                            switch resource.key {
                            case .wikipedia:
                                Text("Wikipedia")
                            }
                        }
                    }
                }
                .class("row")
            }
        }
        .class("instrument")
    }

    init(instrument: StringInstrument) {
        self.instrument = instrument
    }
}

// MARK: - Supporting Types

private struct Header: Component {
    let title: String

    var body: Component {
        Span("\(self.title): ")
            .class("title")
    }

    init(_ title: String) {
        self.title = title
    }
}
