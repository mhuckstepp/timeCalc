//
//  Helpers.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/6/22.
//

import Foundation

struct RaceObject: Hashable {
   var distance: Double
   var name: String
}

let distances: [RaceObject] = [RaceObject(distance: 3.10686, name: "5K"), RaceObject(distance: 5, name: "5 Miles"), RaceObject(distance: 6.21371, name: "10K") , RaceObject(distance:10, name: "10 Miles"), RaceObject(distance: 13.1094, name: "Half Marathon"), RaceObject(distance:20, name: "20 Miles"),  RaceObject(distance:26.2187575, name: "Marathon"),  RaceObject(distance:50, name: "50 Miles")]


func getPace(speed: String) -> String {
    if(speed == "0" || speed == "" ) { return "--:--"  }
    let speed = max(Double(speed) ?? 1, 1)
    let timeinMinutes: TimeInterval = 60 / speed
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    return formatter.string(from: timeinMinutes * 60)!
}

func convertDistanceAndSpeedToTime(distance: Double, speed: String) -> String {
    let timeInHours: TimeInterval = Double(distance) / (Double(speed) ?? 1)
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    return formatter.string(from: timeInHours * 60 * 60)!
}

func convertTimeInMinutesToString(timeInMinutes: Double) -> String {
    guard (!timeInMinutes.isNaN && !timeInMinutes.isInfinite && timeInMinutes != 0 )  else { return "-----"}
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    return formatter.string(from: timeInMinutes * 60)!
}
