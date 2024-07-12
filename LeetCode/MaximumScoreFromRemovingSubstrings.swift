//
//  MaximumScoreFromRemovingSubstrings.swift
//  https://leetcode.com/problems/maximum-score-from-removing-substrings/
//
//  Created by Erik Radicheski da Silva on 12/07/24.
//

import XCTest

final class MaximumScoreFromRemovingSubstrings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumGain("cdbcbbaaabab", 4, 5), 19)
    }

    func testExampleB() {
        XCTAssertEqual(solution.maximumGain("aabbaaxybbaabb", 5, 4), 20)
    }
}

private class Solution {
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        var stack = [Character]()
        var score = 0
        
        let priority: [Character] = x > y ? ["a", "b"] : ["b", "a"]
        
        for letter in s {
            if stack.last == priority[0] && letter == priority[1] {
                let _ = stack.popLast()
                score += max(x, y)
            } else {
                stack.append(letter)
            }
        }
        
        let newString = stack
        stack.removeAll()
        
        for letter in newString {
            if stack.last == priority[1] && letter == priority[0] {
                let _ = stack.popLast()
                score += min(x, y)
            } else {
                stack.append(letter)
            }
        }
        
        return score
    }
}
