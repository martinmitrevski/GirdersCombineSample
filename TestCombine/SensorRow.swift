//
//  SensorRow.swift
//  TestCombine
//
//  Created by Martin Mitrevski on 2/4/20.
//  Copyright © 2020 Netcetera. All rights reserved.
//

import SwiftUI

struct SensorRow: View {
    
    let sensor: Sensor
    
    var body: some View {
        Text(sensor.description)
    }
}
