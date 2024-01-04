//
//  MinimumNumberOfOperationsToMakeArrayEmpty.swift
//  https://leetcode.com/problems/minimum-number-of-operations-to-make-array-empty/
//
//  Created by Erik Radicheski da Silva on 04/01/24.
//

import XCTest

final class MinimumNumberOfOperationsToMakeArrayEmpty: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations([2, 3, 3, 2, 2, 4, 2, 3, 4]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations([2, 1, 2, 2, 3, 3]), -1)
    }
    
}

private class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var count = Dictionary(nums.map { ($0, 1) }, uniquingKeysWith: +)
        
        guard count.values.min()! > 1 else { return -1 }
        
        var answer = 0
        
        for count in count.values {
            answer += count / 3
            
            if count.isMultiple(of: 3) == false {
                answer += 1
            }
        }
        
        return answer
    }
}
