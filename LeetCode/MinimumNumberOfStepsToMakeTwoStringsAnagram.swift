//
//  MinimumNumberOfStepsToMakeTwoStringsAnagram.swift
//  https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram/
//
//  Created by Erik Radicheski da Silva on 13/01/24.
//

import XCTest

final class MinimumNumberOfStepsToMakeTwoStringsAnagram: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minSteps("bab", "aba"), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minSteps("leetcode", "practice"), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minSteps("anagram", "mangaar"), 0)
    }
    
}

private class Solution {
    func minSteps(_ s: String, _ t: String) -> Int {
        let s = Dictionary(Array(s).map { ($0, 1) }, uniquingKeysWith: +)
        let t = Dictionary(Array(t).map { ($0, 1) }, uniquingKeysWith: +)
        
        var characters = Set(s.keys).union(Set(t.keys))
        var count = Array(repeating: 0, count: characters.count)
        
        for (i, character) in characters.enumerated() {
            count[i] = s[character, default: 0] - t[character, default: 0]
        }
        
        count.sort()
        
        var left = 0
        var right = count.endIndex - 1
        
        var answer = 0
        
        while left < right {
            guard count[left] != 0 else { left += 1; continue }
            guard count[right] != 0 else { right -= 1; continue }
            
            let change = min(abs(count[left]), abs(count[right]))
            
            count[left] += change
            count[right] -= change
            
            answer += change
        }
        
        return answer
    }
}
