//
//  OneThreeTwoPattern.swift
//  https://leetcode.com/problems/132-pattern/
//
//  Created by Erik Radicheski da Silva on 30/09/23.
//

import XCTest

final class OneThreeTwoPattern: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertFalse(solution.find132pattern([1, 2, 3, 4]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.find132pattern([3, 1, 4, 2]))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.find132pattern([-1, 3, 2, 0]))
    }
  
}

private class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        var stack = [(numI: Int, numJ: Int)]()
        
        var minimum = nums[0]
        
        for numK in nums.dropFirst() {
            while let last = stack.last, last.numJ <= numK {
                let _ = stack.popLast()
            }
            
            if let last = stack.last, last.numI < numK {
                return true
            }
            
            stack.append((minimum, numK))
            minimum = min(minimum, numK)
        }
        
        return false
    }
}
