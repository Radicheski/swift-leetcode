//
//  MinimumNumberOfOperationsToMakeArrayContinuous.swift
//  https://leetcode.com/problems/minimum-number-of-operations-to-make-array-continuous/
//
//  Created by Erik Radicheski da Silva on 10/10/23.
//

import XCTest

final class MinimumNumberOfOperationsToMakeArrayContinuous: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations([4, 2, 5, 3]), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations([1, 2, 3, 5, 6]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minOperations([1, 10, 100, 1000]), 3)
    }

}

private class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        let n = nums.count
        var answer = n
        let newNums = Set(nums).sorted()
        
        for (i, left) in newNums.enumerated() {
            let right = left + n - 1
            let j = binarySearch(right, newNums)
            
            answer = min(answer, n + i - j)
        }
        
        return answer
    }
    
    private func binarySearch(_ target: Int, _ nums: [Int]) -> Int {
        var left = nums.startIndex
        var right = nums.endIndex
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if target < nums[middle] {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
}
