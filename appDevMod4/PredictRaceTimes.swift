//
//  PredictRaceTimes.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/29/22.
//

import SwiftUI

func stringToNum(possNum: String) -> Double {
    return Double(possNum) ?? 0
}

struct PredictRaceTimes: View {
    @State private var minutes: String = "0"
    @State private var seconds: String = "0"
    @State private var hours: String = "0"
    @State private var knownDistance: String = "0"
    
    func predictTime(distanceToPredict: Double) -> String {
        guard (hours != "" && minutes != "" && seconds != "" && knownDistance != "")  else { return "-----"}
        let minutes = stringToNum(possNum: hours) * 60 + stringToNum(possNum: minutes) + stringToNum(possNum: seconds) / 60
        return convertTimeInMinutesToString(timeInMinutes: minutes * pow(distanceToPredict / stringToNum(possNum: knownDistance), 1.06))
    }
    
    
    var body: some View {
        HStack {
            VStack{
                Text("Hours")
                TextField("Hours", text: $hours).keyboardType(.numberPad).multilineTextAlignment(.center).border(Color.gray).frame(width: 50, alignment: .center)
            }
            VStack{
                Text("Minutes")
                TextField("Minutes", text: $minutes).keyboardType(.numberPad).multilineTextAlignment(.center).border(Color.gray).frame(width: 50, alignment: .center)
            }
            VStack{
                Text("Seconds")
                TextField("Seconds", text: $seconds).keyboardType(.numberPad).multilineTextAlignment(.center).border(Color.gray).frame(width: 50, alignment: .center)
            }
        }
        VStack{
            Text("Distance (miles)")
            TextField("Distance", text: $knownDistance).keyboardType(.numberPad).multilineTextAlignment(.center).border(Color.gray).frame(width: 100, alignment: .center)
        }
        List(distances, id: \.self) { race in
            Text("Predicted Time for \(race.name):")
            Text(predictTime(distanceToPredict: race.distance))
        }
    }
}
