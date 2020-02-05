//
//  ContentView.swift
//  TestCombine
//
//  Created by Martin Mitrevski on 2/3/20.
//  Copyright © 2020 Netcetera. All rights reserved.
//

import SwiftUI
import GirdersSwift

struct ContentView: View {
    
    @ObservedObject var viewModel = SensorsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.sensors) { sensor in
                NavigationLink(destination: SensorDetails(viewModel: SensorViewModel(sensorId: sensor.id))) {
                    SensorRow(sensor: sensor)
                }
            }
        .navigationBarTitle("Sensors")
        }
    }
}
