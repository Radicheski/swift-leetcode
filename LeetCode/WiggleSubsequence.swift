//
//  WiggleSubsequence.swift
//  https://leetcode.com/problems/wiggle-subsequence/
//
//  Created by Erik Radicheski da Silva on 16/12/22.
//

import XCTest

final class WiggleSubsequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.wiggleMaxLength([1, 7, 4, 9, 2, 5]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.wiggleMaxLength([1, 17, 5, 10, 13, 15, 10, 5, 16, 8]), 7)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.wiggleMaxLength([1, 2, 3, 4, 5, 6, 7, 8, 9]), 2)
    }

}

private class Solution {
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        
        var up = Array(repeating: 0, count: nums.count)
        var down = Array(repeating: 0, count: nums.count)
        
        for i in 1 ..< nums.endIndex {
            for j in 0 ..< i {
                if nums[i] > nums[j] {
                    up[i] = max(up[i], down[j] + 1)
                } else if nums[i] < nums[j] {
                    down[i] = max(down[i], up[j] + 1)
                }
            }
        }
        
        return 1 + max(down.last!, up.last!)
    }
}
