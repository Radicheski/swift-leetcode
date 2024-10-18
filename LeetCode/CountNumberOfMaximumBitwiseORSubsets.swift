//
//  CountNumberOfMaximumBitwiseORSubsets.swift
//  https://leetcode.com/problems/count-number-of-maximum-bitwise-or-subsets/
//
//  Created by Erik Radicheski da Silva on 18/10/24.
//

import XCTest

final class CountNumberOfMaximumBitwiseORSubsets: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countMaxOrSubsets([3, 1]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countMaxOrSubsets([2, 2, 2]), 7)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countMaxOrSubsets([3, 2, 1, 5]), 6)
    }
    
}

private class Solution {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        let n = nums.count
        var maxOrValue = 0
        
        for num in nums {
            maxOrValue |= num;
        }
        
        var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: maxOrValue + 1), count: n)
        
        return countMaxOrSubsets(nums, 0, 0, maxOrValue, &memo)
    }
    
    private func countMaxOrSubsets(_ nums: [Int], _ index: Int, _ currentOr: Int, _ targetOr: Int, _ memo: inout [[Int?]]) -> Int {
        if index == nums.count {
            return currentOr == targetOr ? 1 : 0
        }
        
        if let answer = memo[index][currentOr] {
            return answer
        }
        
        let countWithout = countMaxOrSubsets(nums, index + 1, currentOr, targetOr, &memo)
        let countWith = countMaxOrSubsets(nums, index + 1, currentOr | nums[index], targetOr, &memo)
        
        memo[index][currentOr] = countWith + countWithout
        
        return countWith + countWithout
    }
}
