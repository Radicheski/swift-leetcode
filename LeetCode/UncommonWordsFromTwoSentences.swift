//
//  UncommonWordsFromTwoSentences.swift
//  https://leetcode.com/problems/uncommon-words-from-two-sentences/
//
//  Created by Erik Radicheski da Silva on 17/09/24.
//

import XCTest

final class UncommonWordsFromTwoSentences: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.uncommonFromSentences("this apple is sweet", "this apple is sour"), ["sweet","sour"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.uncommonFromSentences("apple apple", "banana"), ["banana"])
    }
    
}

private class Solution {
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        var count = [String: Int]()
        
        for string in [s1, s2] {
            for word in string.components(separatedBy: .whitespaces) {
                count[word, default: 0] += 1
            }
        }
        
        return count.filter { $0.value == 1 }.map(\.key)
    }
}
