// Copyright © 2022 Brian Drelling. All rights reserved.

import InstrumentKit

extension StringInstrument {
    var url: String {
        "/instruments/\(self.id)"
    }
}
