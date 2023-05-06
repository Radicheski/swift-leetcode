//
//  NumberOfSubsequencesThatSatisfyTheGivenSumCondition.swift
//  https://leetcode.com/problems/number-of-subsequences-that-satisfy-the-given-sum-condition/
//
//  Created by Erik Radicheski da Silva on 06/05/23.
//

import XCTest

final class NumberOfSubsequencesThatSatisfyTheGivenSumCondition: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numSubseq([3, 5, 6, 7], 9), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numSubseq([3, 3, 6, 8], 10), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numSubseq([2, 3, 3, 4, 6, 7], 12), 61)
    }

}

private class Solution {
    private let mod = 1000000007
    
    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        
        var power = Array(repeating: 1, count: nums.count)
        for i in 1 ..< nums.endIndex {
            power[i] = (power[i - 1] * 2) % mod
        }
        
        var answer = 0
        
        for left in 0 ..< nums.endIndex {
            let right = binarySearch(nums, target - nums[left]) - 1
            
            if right >= left {
                answer += power[right - left]
                answer %= mod
            }
        }
        
        return answer
    }
    
    private func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.endIndex - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] <= target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return left
    }
    
}
