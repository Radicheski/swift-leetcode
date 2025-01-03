//
//  NumberOfWaysToSplitArray.swift
//  https://leetcode.com/problems/number-of-ways-to-split-array/
//
//  Created by Erik Radicheski da Silva on 02/01/25.
//

import XCTest

final class NumberOfWaysToSplitArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.waysToSplitArray([10, 4, -8, 7]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.waysToSplitArray([2, 3, 1, 0]), 2)
    }
    
}

private class Solution {
    func waysToSplitArray(_ nums: [Int]) -> Int {
        var prefix = Array(repeating: 0, count: nums.count)
        prefix[0] = nums[0]
        var totalSum = 0
        
        for i in 1 ..< nums.endIndex {
            prefix[i] = prefix[i - 1] + nums[i]
            totalSum = prefix[i]
        }
        
        var answer = 0
        
        for i in 0 ..< nums.endIndex - 1 {
            if 2 * prefix[i] < totalSum { continue }
            
            answer += 1
        }
        
        return answer
    }
}
