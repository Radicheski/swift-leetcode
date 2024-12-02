//
//  CheckIfAWordOccursAsAPrefixOfAnyWordInASentence.swift
//  https://leetcode.com/problems/check-if-a-word-occurs-as-a-prefix-of-any-word-in-a-sentence/
//
//  Created by Erik Radicheski da Silva on 02/12/24.
//

import XCTest

final class CheckIfAWordOccursAsAPrefixOfAnyWordInASentence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.isPrefixOfWord("i love eating burger", "burg"), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.isPrefixOfWord("this problem is an easy problem", "pro"), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.isPrefixOfWord("i am tired", "you"), -1)
    }
    
}

private class Solution {
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        let searchWord = Array(searchWord)
        let sentence = sentence.components(separatedBy: .whitespaces).map(Array.init)
        
        for (i, word) in sentence.enumerated() {
            if isPrefix(word, searchWord) { return i + 1 }
        }
        
        return -1
    }
    
    private func isPrefix(_ word: [Character], _ searchWord: [Character]) -> Bool {
        if word.count < searchWord.count { return false }
        
        for i in searchWord.indices {
            if word[i] != searchWord[i] { return false }
        }
        
        return true
    }
}
