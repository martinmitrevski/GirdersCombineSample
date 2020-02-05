//
//  SensorsViewModel.swift
//  TestCombine
//
//  Created by Martin Mitrevski on 2/4/20.
//  Copyright © 2020 Netcetera. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

class SensorsViewModel: ObservableObject {
    
    @Published var sensors: [Sensor] = []
    private var disposables = Set<AnyCancellable>()
    
    private let pulseAPI: PulseAPI
    
    init(pulseAPI: PulseAPI = PulseAPI()) {
        self.pulseAPI = pulseAPI
        _ = self.pulseAPI.loadSensors().sink(receiveCompletion: { [weak self] value in
            switch value {
            case .failure:
              self?.sensors = []
            case .finished:
              break
            }
        }) { [weak self] (sensors) in
            self?.sensors = sensors
        }
        .store(in: &disposables)
        
    }
    
}
