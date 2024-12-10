//
//  FindLongestSpecialSubstringThatOccursThrice1.swift
//  https://leetcode.com/problems/find-longest-special-substring-that-occurs-thrice-i/
//
//  Created by Erik Radicheski da Silva on 10/12/24.
//

import XCTest

final class FindLongestSpecialSubstringThatOccursThrice1: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumLength("aaaa"), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumLength("abcdef"), -1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumLength("abcaba"), 1)
    }
    
}

private class Solution {
    func maximumLength(_ s: String) -> Int {
        let s = Array(s)
        var count = [[Character]: Int]()
        
        for start in 0 ..< s.endIndex {
            var substring = [Character]()
            
            for end in start ..< s.endIndex {
                if let last = substring.last, last != s[end] {
                    break
                }
                
                substring.append(s[end])
                count[substring, default: 0] += 1
            }
        }
        
        return count.filter { $0.value >= 3 }.map(\.key.count).max() ?? -1
    }
}
