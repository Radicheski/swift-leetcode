//
//  ZeroArrayTransformationII.swift
//  https://leetcode.com/problems/zero-array-transformation-ii/
//
//  Created by Erik Radicheski da Silva on 13/03/25.
//

import XCTest

final class ZeroArrayTransformationII: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minZeroArray([2, 0, 2],  [[0, 2, 1], [0, 2, 1], [1, 1, 3]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minZeroArray([4, 3, 2, 1], [[1, 3, 2], [0, 2, 1]]), -1)
    }
    
}

private class Solution {
    func minZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Int {
        var left = 0
        var right = queries.endIndex
        
        guard zeroArray(nums, queries, right) else { return -1 }
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if zeroArray(nums, queries, middle) {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
    
    private func zeroArray(_ nums: [Int], _ queries: [[Int]], _ k: Int) -> Bool {
        let n = nums.count
        var sum = 0
        var differenceArray = Array(repeating: 0, count: n + 1)
        
        for i in 0 ..< k {
            let start = queries[i][0]
            let end = queries[i][1]
            let value = queries[i][2]
            
            differenceArray[start] += value
            differenceArray[end + 1] -= value
        }
        
        for (i, num) in nums.enumerated() {
            sum += differenceArray[i]
            
            if sum < num { return false }
        }
        
        return true
    }
}
