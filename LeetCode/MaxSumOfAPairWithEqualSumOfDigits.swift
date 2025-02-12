//
//  MaxSumOfAPairWithEqualSumOfDigits.swift
//  https://leetcode.com/problems/max-sum-of-a-pair-with-equal-sum-of-digits/
//
//  Created by Erik Radicheski da Silva on 12/02/25.
//

import XCTest

final class MaxSumOfAPairWithEqualSumOfDigits: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumSum([18, 43, 36, 13, 7]), 54)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumSum([10, 12, 19, 14]), -1)
    }
    
}

private class Solution {
    func maximumSum(_ nums: [Int]) -> Int {
        var digitsSum = [Int: [Int]]()
        
        for (i, num) in nums.enumerated() {
            var num = num
            var digitSum = 0
            
            while num > 0 {
                digitSum += num % 10
                num /= 10
            }
            
            digitsSum[digitSum, default: []].append(i)
        }
        
        var answer = -1
        
        for (_, indices) in digitsSum {
            guard indices.count > 1 else { continue }

            for i in 0 ..< indices.endIndex - 1 {
                for j in i + 1 ..< indices.endIndex {
                    answer = max(answer, nums[indices[i]] + nums[indices[j]])
                }
            }
        }
        
        return answer
    }
}
