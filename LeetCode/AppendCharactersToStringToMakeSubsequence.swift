//
//  AppendCharactersToStringToMakeSubsequence.swift
//  https://leetcode.com/problems/append-characters-to-string-to-make-subsequence/
//
//  Created by Erik Radicheski da Silva on 03/06/24.
//

import XCTest

final class AppendCharactersToStringToMakeSubsequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.appendCharacters("coaching", "coding"), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.appendCharacters("abcde", "a"), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.appendCharacters("z", "abcde"), 5)
    }
    
}

private class Solution {
    func appendCharacters(_ s: String, _ t: String) -> Int {
        let s = Array(s)
        let t = Array(t)
        
        var index = 0
        
        for character in s {
            if character == t[index] {
                index += 1
            }
            
            guard t.indices.contains(index) else { return 0 }
        }
        
        return t.count - index
    }
}
