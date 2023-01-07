//
//  GasStation.swift
//  https://leetcode.com/problems/gas-station/
//
//  Created by Erik Radicheski da Silva on 07/01/23.
//

import XCTest

final class GasStation: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.canCompleteCircuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.canCompleteCircuit([2, 3, 4], [3, 4, 3]), -1)
    }

}

private class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var accumulatedSurplus = 0
        var surplus = 0
        
        var startIndex = 0
        
        for i in 0 ..< gas.endIndex {
            accumulatedSurplus += gas[i] - cost[i]
            surplus += gas[i] - cost[i]
            
            if surplus < 0 {
                surplus = 0
                startIndex = i + 1
            }
        }
        
        return accumulatedSurplus < 0 ? -1 : startIndex
    }
}
