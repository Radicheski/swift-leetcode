//
//  InsertInterval.swift
//  https://leetcode.com/problems/insert-interval/
//
//  Created by Erik Radicheski da Silva on 25/11/22.
//

import XCTest

final class InsertInterval: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.insert([[1, 3], [6, 9]], [2, 5]), [[1, 5], [6, 9]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]), [[1, 2], [3, 10], [12, 16]])
    }

}

private class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var intervals = intervals
        
        if let insertIndex = intervals.firstIndex(where: { $0[0] >= newInterval[0] } ) {
            intervals.insert(newInterval, at: insertIndex)
        } else {
            intervals.append(newInterval)
        }
        
        var index = 0
        
        while index < intervals.endIndex - 1 {
            if intervals[index][1] >= intervals[index + 1][0] {
                intervals[index][1] = max(intervals[index][1], intervals[index + 1][1])
                intervals.remove(at: index + 1)
            } else {
                index += 1
            }
        }
            
        return intervals
    }
}
