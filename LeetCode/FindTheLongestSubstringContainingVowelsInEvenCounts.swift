//
//  FindTheLongestSubstringContainingVowelsInEvenCounts.swift
//  https://leetcode.com/problems/find-the-longest-substring-containing-vowels-in-even-counts/
//
//  Created by Erik Radicheski da Silva on 15/09/24.
//

import XCTest

final class FindTheLongestSubstringContainingVowelsInEvenCounts: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findTheLongestSubstring("eleetminicoworoep"), 13)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findTheLongestSubstring("leetcodeisgreat"), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findTheLongestSubstring("bcbcbc"), 6)
    }
    
}

private class Solution {
    private let map: [Character: Int] = ["a": 1, "e": 2, "i": 4, "o": 8, "u": 16]
    
    func findTheLongestSubstring(_ s: String) -> Int {
        let s = s.compactMap { map[$0, default: 0] }
        
        var firstOccurrence: [Int?] = Array(repeating: nil, count: 32)
        firstOccurrence[0] = -1
        var maxLength = 0
        var xor = 0
        
        for (i, num) in s.enumerated() {
            xor ^= num
            
            if let previous = firstOccurrence[xor] {
                maxLength = max(maxLength, i - previous)
            } else {
                firstOccurrence[xor] = i
            }
        }
        
        return maxLength
    }
}
