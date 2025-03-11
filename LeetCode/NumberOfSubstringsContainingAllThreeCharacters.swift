//
//  NumberOfSubstringsContainingAllThreeCharacters.swift
//  https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/
//
//  Created by Erik Radicheski da Silva on 11/03/25.
//

import XCTest

final class NumberOfSubstringsContainingAllThreeCharacters: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfSubstrings("abcabc"), 10)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfSubstrings("aaacb"), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numberOfSubstrings("abc"), 1)
    }
    
}

private class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        let s = Array(s)
        var characterCount = [Character: Int]()
        var substringCount = 0
        
        var left = 0
        var right = 0
        
        while right < s.endIndex {
            characterCount[s[right], default: 0] += 1
            
            while characterCount.count == 3 {
                substringCount += s.count - right
                
                characterCount[s[left], default: 0] -= 1
                if characterCount[s[left]] == 0 { characterCount[s[left]] = nil }
                
                left += 1
            }
            
            right += 1
        }
        
        return substringCount
    }
}
