//
//  NeighboringBitwiseXOR.swift
//  https://leetcode.com/problems/neighboring-bitwise-xor/
//
//  Created by Erik Radicheski da Silva on 18/01/25.
//

import XCTest

final class NeighboringBitwiseXOR: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.doesValidArrayExist([1, 1, 0]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.doesValidArrayExist([1, 1]))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.doesValidArrayExist([1, 0]))
    }
    
}

private class Solution {
    func doesValidArrayExist(_ derived: [Int]) -> Bool {
        return derived.reduce(into: 0, ^=) == 0
    }
}
