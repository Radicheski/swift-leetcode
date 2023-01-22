//
//  PalindromePartitioning.swift
//  https://leetcode.com/problems/palindrome-partitioning/
//
//  Created by Erik Radicheski da Silva on 22/01/23.
//

import XCTest

final class PalindromePartitioning: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.partition("aab"), [["a", "a", "b"], ["aa", "b"]])
    }

    func testExampleB() {
        XCTAssertEqual(solution.partition("a"), [["a"]])
    }
    
}

private class Solution {
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var currentList = [String]()
        
        depthFirst(0, &result, &currentList, Array(s))
        
        return result
    }
    
    private func depthFirst(_ start: Int, _ result: inout [[String]], _ currentList: inout [String], _ s: [Character]) {
        if start >= s.endIndex {
            result.append(currentList)
        }
        
        for end in start ..< s.endIndex {
            if isPalindrome(s, start, end) {
                currentList.append(String(s[start ... end]))
                depthFirst(end + 1, &result, &currentList, s)
                let _ = currentList.removeLast()
            }
        }
    }
    
    private func isPalindrome(_ s: [Character], _ start: Int, _ end: Int) -> Bool {
        var start = start
        var end = end
        
        while start < end {
            if s[start] != s[end] {
                return false
            }
            
            start += 1
            end -= 1
        }
        
        return true
    }
}
