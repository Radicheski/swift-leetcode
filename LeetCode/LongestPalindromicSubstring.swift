//
//  LongestPalindromicSubstring.swift
//  https://leetcode.com/problems/longest-palindromic-substring/
//
//  Created by Erik Radicheski da Silva on 06/10/22.
//

import XCTest

final class LongestPalindromicSubstring: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let output = solution.longestPalindrome("babad")
        XCTAssertTrue(output == "bab" || output == "aba")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestPalindrome("cbbd"), "bb")
    }
    
}

private class Solution {
    func longestPalindrome(_ s: String) -> String {
        let array = Array(s)
        var start = 0
        var end = 0
        
        for index in 0 ..< array.count {
            let length1 = search(s, index, index)
            let length2 = search(s, index, index + 1)
            let length = max(length1, length2)
            if length > end - start {
                start = index - (length - 1) / 2
                end = index + length / 2
            }
        }
        
        return String(array[start ... end])
    }
    
    private func search(_ s: String, _ start: Int, _ end: Int) -> Int {
        let array = Array(s)
        var start = start
        var end = end
        while start >= 0 && end < array.count && array[start] == array[end] {
            start -= 1
            end += 1
        }
        return end - start - 1
    }
}
