//
//  MakeStringASubsequenceUsingCyclicIncrements.swift
//  https://leetcode.com/problems/make-string-a-subsequence-using-cyclic-increments/
//
//  Created by Erik Radicheski da Silva on 04/12/24.
//

import XCTest

final class MakeStringASubsequenceUsingCyclicIncrements: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canMakeSubsequence("abc", "ad"))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.canMakeSubsequence("zc", "ad"))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.canMakeSubsequence("ab", "d"))
    }
    
}

private class Solution {
    func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {
        let map = "abcdefghijklmnopqrstuvwxyz".enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
        
        let str1 = str1.compactMap { map[$0] }
        let str2 = str2.compactMap { map[$0] }
        var (i, j) = (0, 0)
        
        while i < str1.endIndex && j < str2.endIndex {
            if str1[i] == str2[j] || (str1[i] + 1) % 26 == str2[j] {
                j += 1
            }
            
            i += 1
        }
        
        return j == str2.endIndex
    }
}
