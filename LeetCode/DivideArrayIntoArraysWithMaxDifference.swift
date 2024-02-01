//
//  DivideArrayIntoArraysWithMaxDifference.swift
//  https://leetcode.com/problems/divide-array-into-arrays-with-max-difference/
//
//  Created by Erik Radicheski da Silva on 01/02/24.
//

import XCTest

final class DivideArrayIntoArraysWithMaxDifference: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.divideArray([1, 3, 4, 8, 7, 9, 3, 5, 1], 2),
                       [[1, 1, 3], [3, 4, 5], [7, 8, 9]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.divideArray([1, 3, 3, 2, 7, 3], 3), [])
    }
    
}

private class Solution {
    func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
        let nums = nums.sorted()
        
        var answer = [[Int]]()
        
        for i in stride(from: 0, to: nums.endIndex, by: 3) {
            guard nums[i + 2] - nums[i] <= k else { return [] }
            
            answer.append(Array(nums[i ... i + 2]))
        }
        
        return answer
    }
}
