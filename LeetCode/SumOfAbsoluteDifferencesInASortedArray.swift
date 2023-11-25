//
//  SumOfAbsoluteDifferencesInASortedArray.swift
//  https://leetcode.com/problems/sum-of-absolute-differences-in-a-sorted-array/
//
//  Created by Erik Radicheski da Silva on 25/11/23.
//

import XCTest

final class SumOfAbsoluteDifferencesInASortedArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getSumAbsoluteDifferences([2, 3, 5]), [4, 3, 5])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getSumAbsoluteDifferences([1, 4, 6, 8, 10]), [24, 15, 13, 15, 21])
    }
    
}

private class Solution {
    func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var preffix = Array(repeating: 0, count: nums.count + 1)
        var sum = 0
        
        var answer = Array(repeating: 0, count: nums.count)
        
        for (i, num) in nums.enumerated() {
            sum += num
            preffix[i + 1] = sum
        }
        
        for i in nums.indices {
            answer[i] = nums[i] * i - preffix[i]
            answer[i] += (sum - preffix[i]) - nums[i] * (n - i)
        }
        
        return answer
    }
}
