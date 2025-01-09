//
//  CountingWordsWithAGivenPrefix.swift
//  https://leetcode.com/problems/counting-words-with-a-given-prefix/
//
//  Created by Erik Radicheski da Silva on 09/01/25.
//

import XCTest

final class CountingWordsWithAGivenPrefix: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.prefixCount(["pay", "attention", "practice", "attend"], "at"), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.prefixCount(["leetcode", "win", "loops", "success"], "code"), 0)
    }
    
}

private class Solution {
    func prefixCount(_ words: [String], _ pref: String) -> Int {
        var count = 0
        
        for word in words {
            if word.hasPrefix(pref) {
                count += 1
            }
        }
        
        return count
    }
}
