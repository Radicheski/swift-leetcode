//
//  MaximumScoreOfAGoodSubarray.swift
//  https://leetcode.com/problems/maximum-score-of-a-good-subarray/
//
//  Created by Erik Radicheski da Silva on 22/10/23.
//

import XCTest

final class MaximumScoreOfAGoodSubarray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumScore([1, 4, 3, 7, 4, 5], 3), 15)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumScore([5, 5, 4, 5, 4, 1, 1, 1], 0), 20)
    }

}

private class Solution {
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        var answer = nums[k]
        var minimum = nums[k]
        
        var left = k
        var right = k
        
        while left > 0 || right < nums.endIndex - 1 {
            let leftNum = nums.indices.contains(left - 1) ? nums[left - 1] : .min
            let rightNum = nums.indices.contains(right + 1) ? nums[right + 1] : .min
            
            if leftNum < rightNum {
                right += 1
                minimum = min(minimum, nums[right])
            } else {
                left -= 1
                minimum = min(minimum, nums[left])
            }
            
            answer = max(answer, minimum * (right - left + 1))
        }
        
        return answer
    }

}
