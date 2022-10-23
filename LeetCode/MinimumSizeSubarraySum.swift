//
//  MinimumSizeSubarraySum.swift
//  https://leetcode.com/problems/minimum-size-subarray-sum/
//
//  Created by Erik Radicheski da Silva on 23/10/22.
//

import XCTest

final class MinimumSizeSubarraySum: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minSubArrayLen(7, [2, 3, 1, 2, 4, 3]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minSubArrayLen(4, [1, 4, 4]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minSubArrayLen(11, [1, 1, 1, 1, 1, 1, 1, 1]), 0)
    }

}

private class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var minimumSize = Int.max
        
        var start = 0
        var sum = 0
        
        for i in 0 ..< nums.endIndex {
            sum += nums[i]
            
            while sum >= target {
                minimumSize = min(minimumSize, i - start + 1)
                sum -= nums[start]
                start += 1
            }
        }
        
        
        return minimumSize == .max ? 0 : minimumSize
    }
}
