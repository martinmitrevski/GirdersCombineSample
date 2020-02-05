//
//  SensorDetails.swift
//  TestCombine
//
//  Created by Martin Mitrevski on 2/4/20.
//  Copyright © 2020 Netcetera. All rights reserved.
//

import SwiftUI

struct SensorDetails: View {
    
    let viewModel: SensorViewModel
    
    var body: some View {
        VStack {
            Text("\(viewModel.sensor?.description ?? "")")
            Text("\(viewModel.sensor?.comments ?? "")")
            Text("\(viewModel.sensor?.position ?? "")")
            Text("\(viewModel.sensor?.status ?? "")")
            Spacer()
        }
        
    }
}
