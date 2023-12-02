//
//  FindWordsThatCanBeFormedByCharacters.swift
//  https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/
//
//  Created by Erik Radicheski da Silva on 02/12/23.
//

import XCTest

final class FindWordsThatCanBeFormedByCharacters: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countCharacters(["cat", "bt", "hat", "tree"], "atach"), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countCharacters(["hello", "world", "leetcode"], "welldonehoneyr"), 10)
    }

}

private class Solution {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var answer = 0
        let chars = Dictionary(Array(chars).map { ($0, 1) }, uniquingKeysWith: +)
        
        for word in words {
            var chars = chars
            var currentAnswer = 0
            
            for char in word {
                guard let freq = chars[char] else { break }
                guard freq > 0 else { break }
                
                chars[char] = freq - 1
                currentAnswer += 1
            }
            
            if currentAnswer == word.count {
                answer += currentAnswer
            }
        }
        
        return answer
    }
}
