//
//  MaximumSumOf3NonOverlappingSubarrays.swift
//  https://leetcode.com/problems/maximum-sum-of-3-non-overlapping-subarrays/
//
//  Created by Erik Radicheski da Silva on 28/12/24.
//

import XCTest

final class MaximumSumOf3NonOverlappingSubarrays: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxSumOfThreeSubarrays([1, 2, 1, 2, 6, 7, 5, 1], 2), [0, 3, 5])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxSumOfThreeSubarrays([1, 2, 1, 2, 1, 2, 1, 2, 1], 2), [0, 2, 4])
    }
    
}

private class Solution {
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        var prefix = Array(repeating: 0, count: nums.count + 1)
        
        for i in 1 ... nums.endIndex {
            prefix[i] = nums[i - 1] + prefix[i - 1]
        }
        
        var best = Array(repeating: Array(repeating: (sum: 0, index: 0), count: nums.count + 1), count: 4)
        
        for subarrayCount in 1 ... 3 {
            for end in k * subarrayCount ... nums.endIndex {
                let sum = prefix[end]  - prefix[end  - k] + best[subarrayCount - 1][end - k].sum
                
                if sum > best[subarrayCount][end - 1].sum {
                    best[subarrayCount][end] = (sum, end - k)
                } else {
                    best[subarrayCount][end] = best[subarrayCount][end - 1]
                }
            }
        }
        
        var answer = Array(repeating: 0, count: 3)
        var end = nums.count
        for i in stride(from: 3, through: 1, by: -1) {
            answer[i - 1] = best[i][end].index
            end = answer[i - 1]
        }
        
        return answer
    }
    
}
