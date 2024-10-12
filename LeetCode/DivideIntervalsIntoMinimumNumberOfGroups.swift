//
//  DivideIntervalsIntoMinimumNumberOfGroups.swift
//  https://leetcode.com/problems/divide-intervals-into-minimum-number-of-groups/
//
//  Created by Erik Radicheski da Silva on 12/10/24.
//

import XCTest

final class DivideIntervalsIntoMinimumNumberOfGroups: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minGroups([[5,10],[6,8],[1,5],[2,3],[1,10]]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minGroups([[1,3],[5,6],[8,10],[11,13]]), 1)
    }
    
}

private class Solution {
    func minGroups(_ intervals: [[Int]]) -> Int {
        var events = [(time: Int, event: Int)]()
        
        for interval in intervals {
            events.append((interval[0], 1))
            events.append((interval[1] + 1, -1))
        }
        
        events.sort { $0.time == $1.time ? $0.event < $1.event : $0.time < $1.time  }
        
        var maxConcurrent = 0
        var concurrentIntervals = 0
        
        for (time, event) in events {
            concurrentIntervals += event
            maxConcurrent = max(maxConcurrent, concurrentIntervals)
        }
        
        return maxConcurrent
    }
}
