//
//  LongestPalindrome.swift
//  https://leetcode.com/problems/longest-palindrome/
//
//  Created by Erik Radicheski da Silva on 20/08/22.
//

import XCTest

class LongestPalindrome: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.longestPalindrome("abccccdd"), 7)
        XCTAssertEqual(solution.longestPalindrome("a"), 1)
    }

}

private class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var characterCount = [Character: Int]()
        let totalSize = s.count
        
        for character in Set(s) {
            let size = s.replacingOccurrences(of: "\(character)", with: "").count
            characterCount[character] = totalSize - size
        }
        
        var size = characterCount.reduce(into: 0) { $0 += $1.value / 2 } * 2
        if characterCount.first(where: { $0.value % 2 == 1 }) != nil {
            size += 1
        }
        
        return size
    }
}
