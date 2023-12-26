//
//  MinimumChangesToMakeAlternatingBinaryString.swift
//  https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string/
//
//  Created by Erik Radicheski da Silva on 24/12/23.
//

import XCTest

final class MinimumChangesToMakeAlternatingBinaryString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations("0100"), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations("10"), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minOperations("1111"), 2)
    }
    
}

    private class Solution {
        func minOperations(_ s: String) -> Int {
            var changes = Array(repeating: 0, count: 2)
            
            let s = Array(s).map(String.init).compactMap(Int.init)
            var target = 0
            
            for bit in s {
                changes[0] += bit ^ target
                
                target = 1 - target
                
                changes[1] += bit ^ target
            }
            
            return changes.min()!
        }
    }
