//
//  MinimumNumberOfOperationsToMakeElementsInArrayDistinct.swift
//  https://leetcode.com/problems/minimum-number-of-operations-to-make-elements-in-array-distinct/
//
//  Created by Erik Radicheski da Silva on 08/04/25.
//

import XCTest

final class MinimumNumberOfOperationsToMakeElementsInArrayDistinct: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumOperations([1, 2, 3, 4, 2, 3, 3, 5, 7]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumOperations([4, 5, 6, 4, 4]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimumOperations([6, 7, 8, 9]), 0)
    }
}

private class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        var operations = 0
        var count = Dictionary(nums.map { ($0, 1) }, uniquingKeysWith: +)
        count = count.filter { $0.value > 1 }
        
        var i = 0
        
        while i < nums.endIndex {
            if count.isEmpty { break }
            
            for di in [0, 1, 2] {
                guard nums.indices.contains(i + di) else { break }
                
                if let c = count[nums[i + di]], c > 2 {
                    count[nums[i + di]] = c - 1
                } else {
                    count[nums[i + di]] = nil
                }
            }
            
            i += 3
            operations += 1
        }
        
        return operations
    }
}
