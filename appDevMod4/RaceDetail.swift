//
//  RaceDetail.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/6/22.
//

import Foundation

let speedDiffs = 0.02
let totalSpeeds = 50

import SwiftUI

struct RaceTimeRowView: View {
    var currSpeed: String
    var distance: Double

    var body: some View {
        HStack {
            Text(String(currSpeed)).frame(maxWidth: .infinity)
            Text(getPace(speed: currSpeed)).frame(maxWidth: .infinity)
            Text(convertDistanceAndSpeedToTime(distance: distance, speed: max(currSpeed, "1"))).frame(maxWidth: .infinity)
        }
    }
}

struct RaceDetail: View {
    var speed: Double
    var distance: Double
    
    func createSpeedArray(middleSpeed: Double) -> Array<String> {
        let lowestSpeed = middleSpeed - Double((totalSpeeds / 2)) * speedDiffs
        var speeds: Array<String> = []
        for i in 0...totalSpeeds {
            speeds.append(String(lowestSpeed + Double(i) * speedDiffs))
        }
        return speeds
    }
    
    var body: some View {
        Section(header: HStack {
            Text("Speed (mph)").frame(maxWidth: .infinity)
            Text("Pace (min/mile)").frame(maxWidth: .infinity)
            Text("Time").frame(maxWidth: .infinity)
        }) {
            List(createSpeedArray(middleSpeed: max(speed, 6)), id: \.self) { currSpeed in
                    RaceTimeRowView(currSpeed: currSpeed, distance: distance)
                }
        }.navigationTitle(String(format: "%.1f", distance) + " Miles")
    }
}
