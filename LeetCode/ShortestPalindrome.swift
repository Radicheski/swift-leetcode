//
//  ShortestPalindrome.swift
//  https://leetcode.com/problems/shortest-palindrome/
//
//  Created by Erik Radicheski da Silva on 20/09/24.
//

import XCTest

final class ShortestPalindrome: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shortestPalindrome("aacecaaa"), "aaacecaaa")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shortestPalindrome("abcd"), "dcbabcd")
    }
    
}

private class Solution {
    func shortestPalindrome(_ s: String) -> String {
        let s = Array(s)
        let reversedString = String(s.reversed())
        let combinedString = s + ["#"] + s.reversed()
        let prefixTable = buildPrefixTable(combinedString)

        let palindromeLength = prefixTable[combinedString.count - 1]
        let suffix = s[palindromeLength...].reversed().map { $0 }
        return String(suffix + s)
    }

    private func buildPrefixTable(_ s: [Character]) -> [Int] {
        var prefixTable = Array(repeating: 0, count: s.count)
        var length = 0
        for i in 1 ..< s.endIndex {
            while length > 0 && s[i] != s[length] {
                length = prefixTable[length - 1]
            }
            if s[i] == s[length] {
                length += 1
            }
            prefixTable[i] = length
        }
        return prefixTable
    }
}
