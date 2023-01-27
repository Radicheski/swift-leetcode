//
//  ConcatenatedWords.swift
//  https://leetcode.com/problems/concatenated-words/
//
//  Created by Erik Radicheski da Silva on 27/01/23.
//

import XCTest

final class ConcatenatedWords: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let words = ["cat", "cats", "catsdogcats", "dog", "dogcatsdog",
                     "hippopotamuses", "rat", "ratcatdogcat"]
        let expectedOutput = ["catsdogcats", "dogcatsdog", "ratcatdogcat"]
        XCTAssertEqual(solution.findAllConcatenatedWordsInADict(words), expectedOutput)
    }
    
    func testExampleB() {
        let words = ["cat", "dog", "catdog"]
        let expectedOutput = ["catdog"]
        XCTAssertEqual(solution.findAllConcatenatedWordsInADict(words), expectedOutput)
    }

}

private class Solution {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        let dictionary = Set(words)
        var answer = [String]()
        
        for word in words.map(Array.init) {
            let length = word.count
            var dp = Array(repeating: false, count: length + 1)
            dp[0] = true
            for i in 1 ... length {
                let start = i == length ? 1 : 0
                for j in start ..< i {
                    guard dp[i] == false else { break }
                    dp[i] = dp[j] && dictionary.contains(String(word[j ..< i]))
                }
            }
            if dp[length] {
                answer.append(String(word))
            }
        }
        
        return answer
    }
}
