//
//  ScoreOfAString.swift
//  https://leetcode.com/problems/score-of-a-string/
//
//  Created by Erik Radicheski da Silva on 01/06/24.
//

import XCTest

final class ScoreOfAString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.scoreOfString("hello"), 13)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.scoreOfString("zaz"), 50)
    }
    
}

private class Solution {
    func scoreOfString(_ s: String) -> Int {
        let s = s.compactMap(\.asciiValue).map(Int.init)
        
        var score = 0
        
        for i in 1 ..< s.endIndex {
            score += abs(s[i] - s[i - 1])
        }
        
        return score
    }
}
