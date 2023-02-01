//
//  WordLadder.swift
//  https://leetcode.com/problems/word-ladder/
//
//  Created by Erik Radicheski da Silva on 01/02/23.
//

import XCTest

final class WordLadder: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log"]), 0)
    }

}

private class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.contains(endWord) else { return 0 }
        
        let beginWord = Array(beginWord)
        let endWord = Array(endWord)
        let wordList = wordList.map(Array.init)
        
        var possibleDerivations = [[Character]: [[Character]]]()
        
        for word in wordList {
            for i in word.indices {
                var newWord = word
                newWord[i] = "*"
                
                possibleDerivations[newWord, default: []].append(word)
            }
        }
        
        var queue = [(1, beginWord)]
        var seen = Set([beginWord])
        
        while queue.isEmpty == false {
            let (level, word) = queue.removeFirst()
            
            for i in word.indices {
                var newWord = word
                newWord[i] = "*"
                
                for nextWord in possibleDerivations[newWord] ?? [] {
                    if nextWord == endWord { return level + 1}
                    
                    guard seen.contains(nextWord) == false else { continue }
                    
                    seen.insert(nextWord)
                    queue.append((level + 1, nextWord))
                }
            }
        }
        
        return 0
    }
}
