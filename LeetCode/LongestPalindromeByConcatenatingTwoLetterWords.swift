//
//  LongestPalindromeByConcatenatingTwoLetterWords.swift
//  https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words/
//
//  Created by Erik Radicheski da Silva on 13/11/22.
//

import XCTest

final class LongestPalindromeByConcatenatingTwoLetterWords: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestPalindrome(["lc", "cl", "gg"]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestPalindrome(["ab", "ty", "yt", "lc", "cl", "ab"]), 8)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.longestPalindrome(["cc", "ll", "xx"]), 2)
    }
    
}

private class Solution {
    func longestPalindrome(_ words: [String]) -> Int {
        var words = getWordFrequencies(words)
        var wordCount = 0
        
        let symmetricWords = words.filter { $0.key.elementsEqual($0.key.reversed()) }
        if symmetricWords.isEmpty == false {
            if symmetricWords.values.contains(where: { $0.isMultiple(of: 2) == false } ) {
                wordCount += 1
            }
            
            wordCount = symmetricWords.filter { $0.value > 1 }
                .map { $0.value & (Int.max ^ 1) }
                .reduce(into: wordCount) { $0 += $1 }
        }
        
        symmetricWords.forEach { let _ = words.removeValue(forKey: $0.key) }
        
        while words.isEmpty == false {
            guard let word = words.first else { break }
            
            if let symmetricWord = words[word.key.reversed()] {
                wordCount += 2 * min(word.value, symmetricWord)
            }
            
            let _ = words.removeValue(forKey: word.key)
            let _ = words.removeValue(forKey: word.key.reversed())
        }
        
        return wordCount * 2
    }
    
    private func getWordFrequencies(_ words: [String]) -> [[Character]: Int] {
        let tuples = words.map { (Array($0), 1) }
        return Dictionary(tuples, uniquingKeysWith: +)
    }
    
}
