//
//  PulseAPI.swift
//  TestCombine
//
//  Created by Martin Mitrevski on 2/4/20.
//  Copyright © 2020 Netcetera. All rights reserved.
//

import GirdersSwift
import Combine

let sensorPath = "sensor"

enum PulseEndpoint {
    
    case sensors
    case sensor(String)
}

extension PulseEndpoint: ServiceEndpoint {
        
    var path: String {
        switch self {
        case .sensors:
            return sensorPath
        case .sensor(let sensorId):
            return "\(sensorPath)/\(sensorId)"
        }
    }

}

class PulseAPI {
    
    let httpClient: HTTP

    init(with httpClient: HTTP = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func loadSensors() -> AnyPublisher<[Sensor], Error> {
        let request = Request(endpoint: PulseEndpoint.sensors)
        let publisher: AnyPublisher<[SensorResponse], Error> = httpClient.executeRequest(request: request)
        return publisher.map { (response) -> [Sensor] in
            self.convert(sensorsResponse: response)
        }
        .eraseToAnyPublisher()
    }
    
    func loadSensor(with id: String) -> AnyPublisher<Sensor, Error> {
        let request = Request(endpoint: PulseEndpoint.sensor(id))
        let future: Future<SensorResponse, Error> = httpClient.executeRequest(request: request)
        return future.map { (response) -> Sensor in
            self.convert(sensorResponse: response)
        }
        .eraseToAnyPublisher()
    }
    
    private func convert(sensorsResponse: [SensorResponse]) -> [Sensor] {
        let sensors = sensorsResponse.map { (sensorResponse) -> Sensor in
            return convert(sensorResponse: sensorResponse)
        }
        return sensors
    }
    
    private func convert(sensorResponse: SensorResponse) -> Sensor {
        return Sensor(id: sensorResponse.sensorId,
                      position: sensorResponse.position,
                      comments: sensorResponse.comments,
                      type: sensorResponse.type,
                      description: sensorResponse.description,
                      status: sensorResponse.status)
    }
    
}
