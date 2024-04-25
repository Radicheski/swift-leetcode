//
//  LongestIdealSubsequence.swift
//  https://leetcode.com/problems/longest-ideal-subsequence/
//
//  Created by Erik Radicheski da Silva on 25/04/24.
//

import XCTest

final class LongestIdealSubsequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestIdealString("acfgbd", 2), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestIdealString("abcd", 3), 4)
    }
    
}

private class Solution {
    func longestIdealString(_ s: String, _ k: Int) -> Int {
        let chars = s.map { Int($0.asciiValue!) - Int(Character("a").asciiValue!) }
        
        var maxLength = 0
        var lengths = Array(repeating: 0, count: 26)
        
        for char in chars  {
            var length = 0
            
            for diff in -k ... k where lengths.indices.contains(char + diff) {
                length = max(length, lengths[char + diff])
            }
            
            lengths[char] = max(lengths[char], length + 1)
            maxLength = max(maxLength, lengths[char])
        }
        
        return maxLength
    }
}
