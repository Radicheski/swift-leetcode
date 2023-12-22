//
//  MaximumScoreAfterSplittingAString.swift
//  https://leetcode.com/problems/maximum-score-after-splitting-a-string/
//
//  Created by Erik Radicheski da Silva on 22/12/23.
//

import XCTest

final class MaximumScoreAfterSplittingAString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxScore("011101"), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxScore("00111"), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxScore("1111"), 3)
    }
    
}

private class Solution {
    func maxScore(_ s: String) -> Int {
        let s = Array(s)
        
        var score = s[0] == "0" ? 1 : 0
        score += s[1...].filter { $0 == "1" }.count
        
        var answer = score
        
        for i in 1 ..< s.endIndex - 1 {
            if s[i] == "0" {
                score += 1
            } else {
                score -= 1
            }
            
            answer = max(answer, score)
        }
        
        return answer
    }
}
