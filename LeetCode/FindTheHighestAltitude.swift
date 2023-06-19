//
//  FindTheHighestAltitude.swift
//  https://leetcode.com/problems/find-the-highest-altitude/
//
//  Created by Erik Radicheski da Silva on 19/06/23.
//

import XCTest

final class FindTheHighestAltitude: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestAltitude([-5, 1, 5, 0, -7]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestAltitude([-4, -3, -2, -1, 4, 3, 2]), 0)
    }
}

private class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var maxAltitude = 0
        var currentAltitude = 0
        
        for height in gain {
            currentAltitude += height
            maxAltitude = max(maxAltitude, currentAltitude)
        }
        
        return maxAltitude
    }
}
