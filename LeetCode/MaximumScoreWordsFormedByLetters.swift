//
//  MaximumScoreWordsFormedByLetters.swift
//  https://leetcode.com/problems/maximum-score-words-formed-by-letters/
//
//  Created by Erik Radicheski da Silva on 24/05/24.
//

import XCTest

final class MaximumScoreWordsFormedByLetters: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxScoreWords(["dog", "cat", "dad", "good"],
                                              ["a", "a", "c", "d", "d", "d", "g", "o", "o"],
                                              [1, 0, 9, 5, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0,
                                               0, 0, 0, 0, 0, 0, 0, 0]), 23)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxScoreWords(["xxxz", "ax", "bx", "cx"],
                                              ["z", "a", "b", "c", "x", "x", "x"],
                                              [4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                               0, 0, 0, 0, 0, 5, 0, 10]), 27)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxScoreWords(["leetcode"], ["l", "e", "t", "c", "o", "d"],
                                              [0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0,
                                               0, 1, 0, 0, 0, 0, 0, 0]), 0)
    }
    
}

private class Solution {
    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        var answer = 0
        
        let letters = getFrequency(String(letters))
        
        for subset in 0 ..< 1 << words.count {
            var characters = Array(repeating: 0, count: 26)
            for i in 0 ..< words.count where subset & (1 << i) > 0 {
                for (j, freq) in getFrequency(words[i]).enumerated() {
                    characters[j] += freq
                }
            }
            
            guard characters.enumerated().allSatisfy( { $0.element <= letters[$0.offset] } ) else { continue }
            
            var subsetScore = 0
            
            for (i, count) in characters.enumerated() {
                subsetScore += count * score[i]
            }
            
            answer = max(answer, subsetScore)
        }
        
        return answer
    }
    
    private func getFrequency(_ string: String) -> [Int] {
        var frequency = Array(repeating: 0, count: 26)
        
        for character in string {
            frequency[Int(character.asciiValue!) - 97] += 1
        }
        
        return frequency
    }
}
