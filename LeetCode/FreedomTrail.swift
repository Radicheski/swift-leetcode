//
//  FreedomTrail.swift
//  https://leetcode.com/problems/freedom-trail/
//
//  Created by Erik Radicheski da Silva on 27/04/24.
//

import XCTest

final class FreedomTrail: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findRotateSteps("godding", "gd"), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findRotateSteps("godding", "godding"), 13)
    }
    
}

private class Solution {
    func findRotateSteps(_ ring: String, _ key: String) -> Int {
        let ring = Array(ring)
        let key = Array(key)
        
        var bestSteps = Array(repeating: Array(repeating: Int.max, count: key.count + 1), count: ring.count)
        
        for i in ring.indices {
            bestSteps[i][key.count] = 0
        }
        
        for keyIndex in key.indices.reversed() {
            for ringIndex in ring.indices {
                for currentIndex in ring.indices where ring[currentIndex] == key[keyIndex] {
                    bestSteps[ringIndex][keyIndex] = min(bestSteps[ringIndex][keyIndex],
                                                         bestSteps[currentIndex][keyIndex + 1]
                                                         + countSteps(ringIndex, currentIndex, ring.count)
                                                         + 1)
                }
            }
        }
        
        return bestSteps[0][0]
    }
    
    private func countSteps(_ current: Int, _ next: Int, _ ringLength: Int) -> Int {
        let stepsBetween = abs(current - next)
        return min(stepsBetween, ringLength - stepsBetween)
    }
}
