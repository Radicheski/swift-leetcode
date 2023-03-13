//
//  DesignUndergroundSystem.swift
//  https://leetcode.com/problems/design-underground-system/
//
//  Created by Erik Radicheski da Silva on 13/03/23.
//

import XCTest

final class DesignUndergroundSystem: XCTestCase {

    // TODO: Test cases

}

private class UndergroundSystem {
    
    private var travelMap = [Travel: (time: Int, count: Int)]()
    private var customers = [Int: (startStation: String, checkIn: Int)]()
    
    init() {
        
    }
    
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        customers[id] = (stationName, t)
    }
    
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        let (startStation, checkOut) = customers[id]!
        
        let travel = Travel(startStation: startStation, endStation: stationName)
        let time = t - checkOut
        
        let (previousTime, previousCount) = travelMap[travel, default: (0, 0)]
        travelMap[travel] = (previousTime + time, previousCount + 1)
    }
    
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        let travel = Travel(startStation: startStation, endStation: endStation)
        
        let (time, count) = travelMap[travel]!
        
        return Double(time) / Double(count)
    }
    
}

private struct Travel: Hashable {
    let startStation: String
    let endStation: String
}
