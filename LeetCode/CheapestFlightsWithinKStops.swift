//
//  CheapestFlightsWithinKStops.swift
//  https://leetcode.com/problems/cheapest-flights-within-k-stops/
//
//  Created by Erik Radicheski da Silva on 26/01/23.
//

import XCTest

final class CheapestFlightsWithinKStops: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let flights = [[0, 1, 100],
                       [1, 2, 100],
                       [2, 0, 100],
                       [1, 3, 600],
                       [2, 3, 200]]
        XCTAssertEqual(solution.findCheapestPrice(4, flights, 0, 3, 1), 700)
    }
    
    func testExampleB() {
        let flights = [[0, 1, 100],
                       [1, 2, 100],
                       [0, 2, 500]]
        XCTAssertEqual(solution.findCheapestPrice(3, flights, 0, 2, 1), 200)
    }
    
    func testExampleC() {
        let flights = [[0, 1, 100],
                       [1, 2, 100],
                       [0, 2, 500]]
        XCTAssertEqual(solution.findCheapestPrice(3, flights, 0, 2, 0), 500)
    }

}

private class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var distance = Array(repeating: Int.max, count: n)
        distance[src] = 0
        
        for _ in 0 ... k {
            var tempDistance = distance
            
            for flight in flights {
                let flightSrc = flight[0]
                let flightDst = flight[1]
                let flightDist = flight[2]
                
                if distance[flightSrc] != .max {
                    tempDistance[flightDst] = min(tempDistance[flightDst], distance[flightSrc] + flightDist)
                }
            }
            
            distance = tempDistance
        }
        
        return distance[dst] == .max ? -1 : distance[dst]
    }
}
