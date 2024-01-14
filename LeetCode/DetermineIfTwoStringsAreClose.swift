//
//  DetermineIfTwoStringsAreClose.swift
//  https://leetcode.com/problems/determine-if-two-strings-are-close/
//
//  Created by Erik Radicheski da Silva on 14/01/24.
//

import XCTest

final class DetermineIfTwoStringsAreClose: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.closeStrings("abc", "bca"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.closeStrings("a", "aa"))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.closeStrings("cabbba", "abbccc"))
    }
    
}

private class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        guard word1.count == word2.count else { return false }
        
        let count1 = Dictionary(word1.map { ($0, 1) }, uniquingKeysWith: +)
        let count2 = Dictionary(word2.map { ($0, 1) }, uniquingKeysWith: +)
        
        return count1.keys == count2.keys && count1.values.sorted() == count2.values.sorted()
    }
}
