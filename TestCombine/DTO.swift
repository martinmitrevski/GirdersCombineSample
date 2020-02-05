//
//  DTO.swift
//  TestCombine
//
//  Created by Martin Mitrevski on 2/3/20.
//  Copyright © 2020 Netcetera. All rights reserved.
//

import Foundation

struct SensorResponse: Codable {
    let sensorId: String
    let position: String
    let comments: String
    let type: String
    let description: String
    let status: String
}
