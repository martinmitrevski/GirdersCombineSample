//
//  SensorViewModel.swift
//  TestCombine
//
//  Created by Martin Mitrevski on 2/4/20.
//  Copyright © 2020 Netcetera. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

class SensorViewModel: ObservableObject {
    
    @Published var sensor: Sensor?
    private var disposables = Set<AnyCancellable>()
    
    private let pulseAPI: PulseAPI
    
    init(pulseAPI: PulseAPI = PulseAPI(), sensorId: String) {
        self.pulseAPI = pulseAPI
        _ = self.pulseAPI.loadSensor(with: sensorId)
            .sink(receiveCompletion: { [weak self] value in
            switch value {
            case .failure:
              self?.sensor = nil
            case .finished:
              break
            }
        }) { [weak self] (sensor) in
            self?.sensor = sensor
        }
        .store(in: &disposables)
        
    }
    
}
