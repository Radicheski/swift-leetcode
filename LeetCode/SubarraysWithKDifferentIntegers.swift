//
//  SubarraysWithKDifferentIntegers.swift
//  https://leetcode.com/problems/subarrays-with-k-different-integers/
//
//  Created by Erik Radicheski da Silva on 30/03/24.
//

import XCTest

final class SubarraysWithKDifferentIntegers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.subarraysWithKDistinct([1, 2, 1, 2, 3], 2), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.subarraysWithKDistinct([1, 2, 1, 3, 4], 3), 3)
    }
    
}

private class Solution {
    func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
        var frequency = [Int: Int]()
        var answer = 0
        
        var left = 0
        var subarraySize = 0
        
        for (right, num) in nums.enumerated() {
            frequency[num, default: 0] += 1
            
            if frequency.count > k {
                let count = frequency[nums[left], default: 0] - 1
                
                frequency[nums[left]] = count > 0 ? count : nil
                left += 1
                
                subarraySize = 0
            }
            
            if frequency.count == k {
                while let count = frequency[nums[left]],
                      count > 1 {
                    frequency[nums[left]] = count - 1
                    left += 1
                    subarraySize += 1
                }
                
                answer += subarraySize + 1
            }
        }
        
        return answer
    }
}
