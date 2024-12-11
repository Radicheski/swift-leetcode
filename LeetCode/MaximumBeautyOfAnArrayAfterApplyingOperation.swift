//
//  MaximumBeautyOfAnArrayAfterApplyingOperation.swift
//  https://leetcode.com/problems/maximum-beauty-of-an-array-after-applying-operation/
//
//  Created by Erik Radicheski da Silva on 11/12/24.
//

import XCTest

final class MaximumBeautyOfAnArrayAfterApplyingOperation: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumBeauty([4, 6, 1, 2], 2), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumBeauty([1, 1, 1, 1], 10), 4)
    }
    
}

private class Solution {
    func maximumBeauty(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var length = 0
        
        var left = 0
        var right = 0
        
        while left < nums.endIndex {
            length = max(length, right - left + 1)
            right += 1
            
            guard nums.indices.contains(right) else { break }

            while nums[right] - nums[left] > 2 * k {
                left += 1
            }
        }
        
        return length
    }
}
