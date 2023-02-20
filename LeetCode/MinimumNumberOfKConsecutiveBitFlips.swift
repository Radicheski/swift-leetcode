//
//  MinimumNumberOfKConsecutiveBitFlips.swift
//  https://leetcode.com/problems/minimum-number-of-k-consecutive-bit-flips/
//
//  Created by Erik Radicheski da Silva on 20/02/23.
//

import XCTest

final class MinimumNumberOfKConsecutiveBitFlips: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minKBitFlips([0, 1, 0], 1), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minKBitFlips([1, 1, 0], 2), -1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minKBitFlips([0, 0, 0, 1, 0, 1, 1, 0], 3), 3)
    }

}

private class Solution {
    func minKBitFlips(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var count = 0
        
        for i in 0 ... nums.count - k {
            guard nums[i] == 0 else { continue }
            
            for j in i ..< i + k {
                nums[j] = 1 - nums[j]
            }
            
            count += 1
        }
        
        return nums.contains(0) ? -1 : count
    }
}
