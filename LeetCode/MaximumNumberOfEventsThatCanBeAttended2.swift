//
//  MaximumNumberOfEventsThatCanBeAttended2.swift
//  https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended-ii/
//
//  Created by Erik Radicheski da Silva on 15/07/23.
//

import XCTest

final class MaximumNumberOfEventsThatCanBeAttended2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxValue([[1, 2, 4], [3, 4, 3], [2, 3, 1]], 2), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxValue([[1, 2, 4], [3, 4, 3], [2, 3, 10]], 2), 10)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxValue([[1, 1, 1], [2, 2, 2], [3, 3, 3], [4, 4, 4]], 3), 9)
    }

}

private class Solution {
    func maxValue(_ events: [[Int]], _ k: Int) -> Int {
        let events = events.map { (start: $0[0], end: $0[1], value: $0[2]) }.sorted { $0.start < $1.start }
        var dp: [[Int?]] = Array(repeating: Array(repeating: nil, count: events.count), count: k + 1)
        
        return depthFirst(0, k, events, &dp)
    }
    
    private func depthFirst(_ current: Int, _ k: Int, _ events: [(start: Int, end: Int, value: Int)],
                            _ dp: inout [[Int?]]) -> Int {
        guard k > 0 && current < events.count else { return 0 }
        
        if let value = dp[k][current] {
            return value
        }
        
        let next = bisectRight(events, events[current].end)
        
        let result = max(depthFirst(current + 1, k, events, &dp),
                         events[current].value + depthFirst(next, k - 1, events, &dp))
        
        dp[k][current] = result
        return result
    }
    
    private func bisectRight(_ events: [(start: Int, end: Int, value: Int)], _ target: Int) -> Int {
        var left = 0
        var right = events.count
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if events[middle].start <= target {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return left
    }
    
}
