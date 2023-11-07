//
//  EliminateMaximumNumberOfMonsters.swift
//  https://leetcode.com/problems/eliminate-maximum-number-of-monsters/
//
//  Created by Erik Radicheski da Silva on 07/11/23.
//

import XCTest

final class EliminateMaximumNumberOfMonsters: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.eliminateMaximum([1, 3, 4], [1, 1, 1]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.eliminateMaximum([1, 1, 2, 3], [1, 1, 1, 1]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.eliminateMaximum([3, 2, 4], [5, 3, 2]), 1)
    }
    
}

private class Solution {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        guard dist.count > 1 else { return 1 }
        
        var result = 1
        
        var time = dist
        
        for t in time.indices {
            time[t] = dist[t] / speed[t]
            time[t] += dist[t].isMultiple(of: speed[t]) ? 0 : 1
        }
        
        time.sort()
        
        for i in 1 ..< time.endIndex {
            guard time[i] > i else { return i }
        }
        
        return time.count
    }
}
