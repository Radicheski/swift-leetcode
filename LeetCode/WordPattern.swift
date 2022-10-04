//
//  WordPattern.swift
//  https://leetcode.com/problems/word-pattern/
//
//  Created by Erik Radicheski da Silva on 04/10/22.
//

import XCTest

final class WordPattern: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.wordPattern("abba", "dog cat cat dog"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.wordPattern("abba", "dog cat cat fish"))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.wordPattern("aaaa", "dog cat cat dog"))
    }

}

private class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let strings = s.components(separatedBy: .whitespaces)
        
        guard pattern.count == strings.count else { return false }
                
        let charArray = pattern.enumerated()
        
        var result = [String]()
        
        var map = [Character: String]()
        
        for (index, char) in charArray {
            if let word = map[char] {
                result.append(word)
            } else {
                let word = strings[index]
                if map.values.contains(word) {
                    return false
                }
                map[char] = word
                result.append(word)
            }
        }
        
        return s == result.joined(separator: " ")
    }
}
