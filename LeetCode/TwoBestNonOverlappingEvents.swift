//
//  TwoBestNonOverlappingEvents.swift
//  https://leetcode.com/problems/two-best-non-overlapping-events/
//
//  Created by Erik Radicheski da Silva on 08/12/24.
//

import XCTest

final class TwoBestNonOverlappingEvents: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxTwoEvents([[1, 3, 2], [4, 5, 2], [2, 4, 3]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxTwoEvents([[1, 3, 2], [4, 5, 2], [1, 5, 5]]), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxTwoEvents([[1, 5, 3], [1, 5, 1], [6, 6, 5]]), 8)
    }
    
}

private class Solution {
    func maxTwoEvents(_ events: [[Int]]) -> Int {
        var dp: [[Int?]] = Array(repeating: Array(repeating: nil, count: 3), count: events.count)
        
        let events = events.sorted { $0[0] < $1[0] }
        
        return findEvents(0, 0, events, &dp)
    }
    
    private func findEvents(_ index: Int, _ count: Int, _ events: [[Int]], _ dp: inout [[Int?]]) -> Int {
        guard count < 2 else { return 0 }
        guard events.indices.contains(index) else { return 0 }
        
        if let answer = dp[index][count] {
            return answer
        }
        
        let end = events[index][1]
        
        var left = index + 1
        var right = events.endIndex - 1
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if events[middle][0] > end {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        let include = events[index][2] +
            (left < events.endIndex && events[left][0] > end
             ? findEvents(left, count + 1, events, &dp) : 0)
        let exclude = findEvents(index + 1, count, events, &dp)
        
        let answer = max(include, exclude)
        dp[index][count] = answer
        
        return answer
    }
}
