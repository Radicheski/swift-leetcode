//
//  ReductionOperationsToMakeTheArrayElementsEqual.swift
//  https://leetcode.com/problems/reduction-operations-to-make-the-array-elements-equal/
//
//  Created by Erik Radicheski da Silva on 19/11/23.
//

import XCTest

final class ReductionOperationsToMakeTheArrayElementsEqual: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.reductionOperations([5, 1, 3]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.reductionOperations([1, 1, 1]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.reductionOperations([1, 1, 2, 2, 3]), 4)
    }
    
}

private class Solution {
    func reductionOperations(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        let nums = nums.sorted(by: >)
        var answer = 0
        
        for i in 1 ..< nums.endIndex {
            if nums[i] < nums[i - 1] {
                answer += i
            }
        }
        
        return answer
    }
}
