//
//  ReconstructItinerary.swift
//  https://leetcode.com/problems/reconstruct-itinerary/
//
//  Created by Erik Radicheski da Silva on 14/09/23.
//

import XCTest

final class ReconstructItinerary: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findItinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]), ["JFK", "MUC",  "LHR", "SFO", "SJC"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findItinerary([["JFK", "SFO"], ["JFK", "ATL"], ["SFO", "ATL"], ["ATL", "JFK"], ["ATL", "SFO"]]), ["JFK", "ATL", "JFK", "SFO", "ATL", "SFO"])
    }

}

private class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var flights = [String: [String]]()
        
        for ticket in tickets {
            flights[ticket[0], default: []].append(ticket[1])
        }
        
        for departure in flights.keys {
            flights[departure]?.sort()
        }
        
        var answer = [String]()
        findItinerary("JFK", &flights, &answer)
        
        return answer.reversed()
    }
    
    private func findItinerary(_ departure: String, _ flights: inout [String: [String]],
                               _ answer: inout [String]) {
        while flights[departure]?.isEmpty == false {
            let nextDeparture = flights[departure]!.removeFirst()
            findItinerary(nextDeparture, &flights, &answer)
        }
        answer.append(departure)
    }
}
