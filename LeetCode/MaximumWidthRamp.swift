//
//  MaximumWidthRamp.swift
//  https://leetcode.com/problems/maximum-width-ramp/
//
//  Created by Erik Radicheski da Silva on 09/10/24.
//

import XCTest

final class MaximumWidthRamp: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxWidthRamp([6, 0, 8, 2, 1, 5]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxWidthRamp([9, 8, 1, 0, 1, 9, 4, 0, 4, 1]), 7)
    }
    
}

private class Solution {
    func maxWidthRamp(_ nums: [Int]) -> Int {
        let indices = nums.indices.sorted { nums[$0] == nums[$1] ? $0 < $1 : nums[$0] < nums[$1] }
        
        var minIndex = nums.count
        var maxWidth = 0
        
        for i in indices {
            maxWidth = max(maxWidth, i - minIndex)
            minIndex = min(minIndex, i)
        }
        
        return maxWidth
    }
}
