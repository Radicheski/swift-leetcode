//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  https://leetcode.com/problems/longest-substring-without-repeating-characters/
//
//  Created by Erik Radicheski da Silva on 19/09/22.
//

import XCTest

final class LongestSubstringWithoutRepeatingCharacters: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.lengthOfLongestSubstring("abcabcbb"), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.lengthOfLongestSubstring("bbbbb"), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.lengthOfLongestSubstring("pwwkew"), 3)
    }
    
}

private class Solution {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        
        var substring = ""
        
        for character in s {
            substring.append(character)
            
            while hasRepeatingCharacters(in: substring) {
                let _ = substring.removeFirst()
            }
            
            maxLength = max(maxLength, substring.count)
        }
        
        return maxLength
    }
    
    func hasRepeatingCharacters(in s: String) -> Bool {
        let keyValue = s.map { ($0, 1) }
        let dict = Dictionary(keyValue, uniquingKeysWith: +)
        return (dict.map { $0.value }.max() ?? 0) > 1
    }
    
}
