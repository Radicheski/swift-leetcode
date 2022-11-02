//
//  WordBreak.swift
//  https://leetcode.com/problems/word-break/
//
//  Created by Erik Radicheski da Silva on 02/11/22.
//

import XCTest

final class WordBreak: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let string = "leetcode"
        let wordDict = ["leet", "code"]
        XCTAssertTrue(solution.wordBreak(string, wordDict))
    }
    
    func testExampleB() {
        let string = "applepenapple"
        let wordDict = ["apple", "pen"]
        XCTAssertTrue(solution.wordBreak(string, wordDict))
    }
    
    func testExampleC() {
        let string = "catsandog"
        let wordDict = ["cats", "dog", "sand", "and", "cat"]
        XCTAssertFalse(solution.wordBreak(string, wordDict))
    }

}

private class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard s.isEmpty == false else { return true }
        
        let string = Array(s)
        let size = s.count
        let set = Set(wordDict)
        var characterFlag = Array(repeating: false, count: size + 1)
        
        for i in 1 ... size {
            if characterFlag[i] == false && checkWord(set, string[0 ..< i]) {
                characterFlag[i] = true
            }
            
            if characterFlag[i] {
                if i == size { return true }
                
                for j in i + 1 ... size {
                    if characterFlag[j] == false && checkWord(set, string[i ..< j]) {
                        characterFlag[j] = true
                    }
                    
                    if j == size && characterFlag[j] {
                        return true
                    }
                }
            }
            
        }
        
        return false
        
    }
    
    private func checkWord(_ set: Set<String>, _ word: ArraySlice<Character>) -> Bool {
        return set.contains(String(word))
    }
}
