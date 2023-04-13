//
//  ValidateStackSequences.swift
//  https://leetcode.com/problems/validate-stack-sequences/
//
//  Created by Erik Radicheski da Silva on 13/04/23.
//

import XCTest

final class ValidateStackSequences: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.validateStackSequences([1, 2, 3, 4, 5], [4, 5, 3, 2, 1]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.validateStackSequences([1, 2, 3, 4, 5], [4, 3, 5, 1, 2]))
    }

}

private class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int]()
        var counter = 0
        
        for num in pushed {
            stack.append(num)
            while stack.isEmpty == false && counter < pushed.count && stack.last == popped[counter] {
                let _ = stack.popLast()
                counter += 1
            }
        }
        
        return counter == pushed.count
    }
}
