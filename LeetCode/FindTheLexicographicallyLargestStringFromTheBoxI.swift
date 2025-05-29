//
//  FindTheLexicographicallyLargestStringFromTheBoxI.swift
//  https://leetcode.com/problems/find-the-lexicographically-largest-string-from-the-box-i/
//
//  Created by Erik Radicheski da Silva on 04/06/25.
//

import XCTest

final class FindTheLexicographicallyLargestStringFromTheBoxI: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.answerString("dbca", 2), "dbc")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.answerString("gggg", 4), "g")
    }
    
}

private class Solution {
    func answerString(_ word: String, _ numFriends: Int) -> String {
        guard numFriends > 1 else { return word }
        
        let word = Array(word)
        var left = 0
        var right = 1
        
        while right < word.endIndex {
            var i = 0
            
            while right + i < word.endIndex && word[left + i] == word[right + i] {
                i += 1
            }
            
            if right + i < word.endIndex && word[left + i] < word[right + i] {
                let t = left
                left = right
                right = max(right + 1, t + i + 1)
            } else {
                right += i + 1
            }
        }
        
        let last = Array(word[left...])
        
        return String(last[0 ..< min(last.count, word.count - numFriends + 1)])
    }
}
