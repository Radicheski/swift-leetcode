//
//  UniqueLength3PalindromicSubsequences.swift
//  https://leetcode.com/problems/unique-length-3-palindromic-subsequence/
//
//  Created by Erik Radicheski da Silva on 14/11/23.
//

import XCTest

final class UniqueLength3PalindromicSubsequences: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countPalindromicSubsequence("aabca"), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countPalindromicSubsequence("adc"), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countPalindromicSubsequence("bbcbaba"), 4)
    }

}

private class Solution {
    func countPalindromicSubsequence(_ s: String) -> Int {
        let s = Array(s)
        var answer = 0
        
        for letter in "abcdefghijklmnopqrstuvwxyz" {
            guard let firstIndex = s.firstIndex(of: letter) else { continue }
            guard let lastIndex = s.lastIndex(of: letter) else { continue }
            guard lastIndex > firstIndex + 1 else { continue }
            
            let lettersInBetween = Set(s[firstIndex + 1 ..< lastIndex])
            answer += lettersInBetween.count
        }
        
        return answer
    }
}
