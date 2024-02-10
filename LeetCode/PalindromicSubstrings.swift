//
//  PalindromicSubstrings.swift
//  https://leetcode.com/problems/palindromic-substrings/
//
//  Created by Erik Radicheski da Silva on 10/02/24.
//

import XCTest

final class PalindromicSubstrings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA(){
        XCTAssertEqual(solution.countSubstrings("abc"), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countSubstrings("aaa"), 6)
    }
    
}

private class Solution {
    func countSubstrings(_ s: String) -> Int {
        let s = Array(s)
        
        var memo = [Int: [Int: Bool]]()
        var answer = s.count
        
        for start in 0 ..< s.endIndex {
            for end in start + 1 ..< s.endIndex {
                if isPalindrome(s, start, end, &memo) {
                    answer += 1
                }
            }
        }
        
        return answer
    }
    
    private func isPalindrome(_ s: [Character], _ start: Int, _ end: Int, _ memo: inout [Int: [Int: Bool]]) -> Bool {
        guard start < end else { return true }
        
        if let answer = memo[start]?[end] {
            return answer
        }
        
        guard s[start] == s[end] else {
            memo[start, default: [:]][end] = false
            return false
        }
        
        let answer = isPalindrome(s, start + 1, end - 1, &memo)
        memo[start, default: [:]][end] = answer
        
        return answer
    }
}
