//
//  FindWordsContainingCharacter.swift
//  https://leetcode.com/problems/find-words-containing-character/
//
//  Created by Erik Radicheski da Silva on 24/05/25.
//

import XCTest

final class FindWordsContainingCharacter: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findWordsContaining(["leet", "code"], "e"), [0, 1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findWordsContaining(["abc", "bcd", "aaaa", "cbc"], "a"), [0, 2])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findWordsContaining( ["abc", "bcd", "aaaa", "cbc"], "z"), [])
    }
    
}

private class Solution {
    func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
        var answer = [Int]()
        
        for (i, word) in words.enumerated() {
            for character in word {
                if character == x {
                    answer.append(i)
                    break
                }
            }
        }
        
        return answer
    }
}
