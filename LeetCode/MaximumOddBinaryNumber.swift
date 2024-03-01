//
//  MaximumOddBinaryNumber.swift
//  https://leetcode.com/problems/maximum-odd-binary-number/
//
//  Created by Erik Radicheski da Silva on 29/02/24.
//

import XCTest

final class MaximumOddBinaryNumber: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumOddBinaryNumber("010"), "001")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumOddBinaryNumber("0101"), "1001")
    }
    
}

private class Solution {
    func maximumOddBinaryNumber(_ s: String) -> String {
        var count = Array(repeating: 0, count: 2)
        
        for char in s {
            if char == "0" {
                count[0] += 1
            } else {
                count[1] += 1
            }
        }
        
        return String(repeating: "1", count: count[1] - 1)
        + String(repeating: "0", count: count[0])
        + "1"
    }
}
