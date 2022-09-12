// Copyright © 2022 Brian Drelling. All rights reserved.

import InstrumentKit
import Plot
import PlotVapor
import Vapor

struct InstrumentTable: Component {
    private let instruments: [StringInstrument]
    private let locale: Locale = .current

    private let header = TableRow {
        TableHeaderCell("Name")
        TableHeaderCell("Strings")

        TableHeaderCell("Courses")

        TableHeaderCell("Classification")
            .class("tooltip")
            .attribute(named: "title", value: "Hornbostel-Sachs Classification")

        TableHeaderCell("Standard Tuning")

        TableHeaderCell("Countries")
            .class("tooltip")
            .attribute(named: "title", value: "Countries of Origin")

        TableHeaderCell("Year")
            .class("tooltip")
            .attribute(named: "title", value: "Approximate Year Invented/Adapted")

        TableHeaderCell("Resources")
    }

    var body: Component {
        Table(header: self.header) {
            for instrument in self.instruments {
                TableRow {
                    TableCell {
                        Link(instrument.name, url: instrument.url)
                    }
                    TableCell(String(instrument.numberOfStrings))
                    TableCell(String(instrument.numberOfCourses))

                    TableCell {
                        for classification in instrument.classifications {
                            Div(classification.rawValue)
                        }
                    }

                    TableCell {
                        if let standardTuning = instrument.standardTuning {
                            Div(standardTuning.notes.description)

                            if instrument.alternateTunings.count > 0 {
                                Link("+ \(instrument.alternateTunings.count) more", url: instrument.url)
                            }
                        }
                    }

                    TableCell {
                        for country in instrument.countries {
                            Span(country.flag)
                                .attribute(named: "title", value: country.localizedName(locale: self.locale))
                        }
                    }

                    if let year = instrument.year {
                        TableCell(String(year))
                    } else {
                        TableCell()
                    }

                    TableCell {
                        for resource in instrument.resources {
                            Link(url: resource.url) {
                                switch resource.key {
                                case .wikipedia:
                                    Text("Wikipedia")
                                }
                            }
                        }
                    }
                }
            }
        }
        .class("instrument-table")
    }

    init(instruments: [StringInstrument]) {
        self.instruments = instruments
    }
}
