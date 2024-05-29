//
//  NumberOfStepsToReduceANumberInBinaryRepresentationToOne.swift
//  https://leetcode.com/problems/number-of-steps-to-reduce-a-number-in-binary-representation-to-one/
//
//  Created by Erik Radicheski da Silva on 29/05/24.
//

import XCTest

final class NumberOfStepsToReduceANumberInBinaryRepresentationToOne: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numSteps("1101"), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numSteps("10"), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numSteps("1"), 0)
    }
    
}

private class Solution {
    func numSteps(_ s: String) -> Int {
        var s = Array(s.reversed())
        
        var count = 0
        var i = 0
        
        while i < s.endIndex - 1 {
            count += 1
            
            if s[i] == "1" {
                var j = i
                
                while j < s.endIndex {
                    if s[j] == "0" {
                        s[j] = "1"
                        break
                    } else {
                        s[j] = "0"
                        j += 1
                    }
                }
                
                if j == s.endIndex {
                    s.append("1")
                }
            } else {
                i += 1
            }
        }
        
        return count
    }
}
