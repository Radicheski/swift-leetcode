//
//  SubarraySumEqualsK.swift
//  https://leetcode.com/problems/subarray-sum-equals-k/
//
//  Created by Erik Radicheski da Silva on 02/10/22.
//

import XCTest

final class SubarraySumEqualsK: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.subarraySum([1, 1, 1], 2), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.subarraySum([1, 2, 3], 3), 2)
    }
    
}

private class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        
        for i in 0 ..< nums.count {
            var sum = nums[i]
            
            if sum == k {
                result += 1
            }
            
            for j in i + 1 ..< nums.count {
                sum += nums[j]
                
                if sum == k {
                    result += 1
                }
            }
            
            
        }
        
        return result
    }
}
