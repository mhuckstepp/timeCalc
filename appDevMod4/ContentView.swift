//
//  ContentView.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var speedString: String = "0"
    @State private var paceMinutesString: String = "0"
    @State private var paceSecondsString: String = "0"
    
    func transformInputsToPace(paceMins: String = "0", paceSecs: String = "0") -> String {
        let minutes = Double(paceMins) ?? 0
        let seconds = Double(paceSecs) ?? 0
        let minutesAndSecs = minutes + seconds / 60
        return String(minutesAndSecs)
    }
        
    func getSpeed(pace: String) -> String {
        if(pace == "0" || pace == "" || Float(pace) == 0) { return "--" }
        guard let pace = Double(pace) else { return "N/A" }
        let rawSpeed = 60 / pace
        return String(format: "%.4f", rawSpeed)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Calulate your speed based on pace")
                HStack {
                    TextField("Minutes", text: $paceMinutesString).keyboardType(.numberPad).multilineTextAlignment(.center).border(Color.gray).frame(width: 50, alignment: .center)
                    Text(":")
                    TextField("Seconds", text: $paceSecondsString).keyboardType(.numberPad).multilineTextAlignment(.center).border(Color.gray).frame(width: 50, alignment: .center)
                }
                Text("mins per mile").padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                Text("Speed = " + getSpeed(pace: transformInputsToPace(paceMins: paceMinutesString, paceSecs: paceSecondsString)) + " MPH")
                Group {
                    Text("Calulate your pace based on speed")
                    TextField("Speed", text: $speedString).keyboardType(.numberPad).multilineTextAlignment(.center).border(Color.gray).frame(width: 100, alignment: .center)
                    Text("mph")
                    Text("Pace = " + getPace(speed: speedString) + " mins/mile")
                    NavigationLink(destination: RaceTimes(speed: self.speedString)) {
                        Text("Go to Race Times based on Speed")
                    }
                }
                PresetRaceSection(speedString: speedString)
                NavigationLink(destination: PredictRaceTimes()) {
                    Text("Predict based on a known time")
                }.padding()
            }
            .padding()
        }
    }
}
