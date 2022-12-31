//
//  Marathon Chart.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/5/22.
//

import SwiftUI

struct RaceResult: Hashable {
   var name: String
   var time: String
}

struct RaceTimes: View {
    var speed: String
    
    
    
    func createTimes(distances: Array<RaceObject>) -> Array<RaceResult> {
        guard (speed != "" && speed != "0")  else { return [RaceResult(name: "N/A", time: "no speed given")] }
        return distances.map { race in
            let distance = race.distance
            let formattedDuration = convertDistanceAndSpeedToTime(distance: distance, speed: speed)

            return RaceResult(name: race.name, time: formattedDuration)
        }
    }
    
    
    var body: some View {
        VStack {
        Text("Speed = " + speed + " MPH").fontWeight(.bold)
            Text("Pace = " + getPace(speed: speed)  + " Mins/Mile").fontWeight(.bold)
            ForEach(createTimes(distances: distances), id: \.self) { race in
                Text(race.name + " - " + race.time + " Hours").padding()
                    }
                }
    }
}
