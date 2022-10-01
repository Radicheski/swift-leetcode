//
//  NonOverlappingIntervals.swift
//  https://leetcode.com/problems/non-overlapping-intervals/
//
//  Created by Erik Radicheski da Silva on 01/10/22.
//

import XCTest

final class NonOverlappingIntervals: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.eraseOverlapIntervals([[1, 2], [2, 3], [3, 4], [1, 3]]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.eraseOverlapIntervals([[1, 2], [1, 2], [1, 2]]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.eraseOverlapIntervals([[1, 2], [2, 3]]), 0)
    }
    
}

private class Solution {
    
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let sortedIntervals = intervals.sorted { $0[1] < $1[1] }
        
        var end = sortedIntervals[0][1]
        var count = 1
        
        for index in 1 ..< sortedIntervals.count {
            
            if sortedIntervals[index][0] >= end {
                end = sortedIntervals[index][1]
                count += 1
            }
            
        }
        
        return intervals.count - count
    }
    
}
