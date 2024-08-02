//
//  MinimumSwapsToGroupAllOnesTogether2.swift
//  https://leetcode.com/problems/minimum-swaps-to-group-all-1s-together-ii/
//
//  Created by Erik Radicheski da Silva on 02/08/24.
//

import XCTest

final class MinimumSwapsToGroupAllOnesTogether2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minSwaps([0, 1, 0, 1, 1, 0, 0]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minSwaps([0, 1, 1, 1, 0, 0, 1, 1, 0]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minSwaps([1, 1, 0, 0, 1]), 0)
    }
    
}

private class Solution {
    func minSwaps(_ nums: [Int]) -> Int {
        var count = 0
        
        for num in nums where num == 1 {
            count += 1
        }
        
        let nums = nums + nums.prefix(count)
        
        var answer = Int.max
        var window = 0
        
        for (i, num) in nums.enumerated() {
            window += 1 - num
            
            if i >= count {
                window -= 1 - nums[i - count]
                answer = min(answer, window)
            }
        }
        
        return answer
    }
}
