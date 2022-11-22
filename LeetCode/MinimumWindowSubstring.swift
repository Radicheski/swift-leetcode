//
//  MinimumWindowSubstring.swift
//  https://leetcode.com/problems/minimum-window-substring/
//
//  Created by Erik Radicheski da Silva on 22/11/22.
//

import XCTest

final class MinimumWindowSubstring: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minWindow("ADOBECODEBANC", "ABC"), "BANC")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minWindow("a", "a"), "a")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minWindow("a", "aa"), "")
    }
    
}

private class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count > 0 && t.count > 0 else { return "" }
        
        let target = Dictionary(t.map { ($0, 1) }, uniquingKeysWith: +)
        
        let s = Array(s)
        let string = s.enumerated().filter { target.keys.contains($0.element) }
        
        let required = target.count
        
        var left = 0
        var right = 0
        
        var formed = 0
        
        var windowCounts = [Character: Int]()
        
        var result = s[0 ..< 0]
        var length = -1
        
        while right < string.count {
            var character = string[right].element
            
            windowCounts[character, default: 0] += 1
            
            if windowCounts[character] == target[character] {
                formed += 1
            }
            
            while left <= right && formed == required {
                character = string[left].element
                
                let start = string[left].offset
                let end = string[right].offset
                
                if length == -1 || end - start + 1 < length {
                    result = s[start ... end]
                    length = end - start + 1
                }
                
                windowCounts[character]? -= 1
                
                if target.keys.contains(character) && windowCounts[character]! < target[character]! {
                    formed -= 1
                }
                
                left += 1
            }
            
            right += 1
        }
        
        return String(result)
    }
}
