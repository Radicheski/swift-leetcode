//
//  CountTheNumberOfConsistentStrings.swift
//  https://leetcode.com/problems/count-the-number-of-consistent-strings/
//
//  Created by Erik Radicheski da Silva on 12/09/24.
//

import XCTest

final class CountTheNumberOfConsistentStrings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countConsistentStrings("ab", ["ad", "bd", "aaab", "baa", "badab"]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countConsistentStrings("abc", ["a", "b", "c", "ab", "ac", "bc", "abc"]), 7)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countConsistentStrings("cad", ["cc", "acd", "b", "ba", "bac", "bad", "ac", "d"]), 4)
    }
    
}

private class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        let allowed = Set(allowed)
        
        return words.map(Set.init).map { $0.subtracting(allowed) }.filter(\.isEmpty).count
    }
}
