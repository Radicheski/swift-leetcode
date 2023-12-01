//
//  CheckIfTwoStringArraysAreEquivalent.swift
//  https://leetcode.com/problems/check-if-two-string-arrays-are-equivalent/
//
//  Created by Erik Radicheski da Silva on 01/12/23.
//

import XCTest

final class CheckIfTwoStringArraysAreEquivalent: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.arrayStringsAreEqual(["ab", "c"], ["a", "bc"]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.arrayStringsAreEqual(["a", "cb"], ["ab", "c"]))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.arrayStringsAreEqual(["abc", "d", "defg"], ["abcddefg"]))
    }
}

private class Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        return word1.reduce(into: "", +=) == word2.reduce(into: "", +=)
    }
}
