//
//  SwiftUIView.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/29/22.
//

import SwiftUI

struct PresetRaceSection: View {
    var speedString: String
    
    var body: some View {
        Text("Look at specific times for a race").padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        HStack {
            ForEach(distances,  id: \.self) { race in
                let distance = race.distance
                NavigationLink(destination: RaceDetail(speed: Double(self.speedString) ?? 6.00, distance: distance)) {
                    Text(String(format: "%.1f" , distance))
                }
            }
        }
    }
}
