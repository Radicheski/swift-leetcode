//
//  NumberOfWaysToStayInTheSamePlaceAfterSomeSteps.swift
//  https://leetcode.com/problems/number-of-ways-to-stay-in-the-same-place-after-some-steps/
//
//  Created by Erik Radicheski da Silva on 15/10/23.
//

import XCTest

final class NumberOfWaysToStayInTheSamePlaceAfterSomeSteps: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numWays(3, 2), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numWays(2, 4), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numWays(4, 2), 8)
    }
    
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        var dp = [Int: [Int: Int]]()
        let range = 0 ..< arrLen
        
        return numWays(0, steps, range, &dp)
    }
    
    private func numWays(_ start: Int, _ steps: Int, _ range: Range<Int>,
                         _ dp: inout [Int: [Int: Int]]) -> Int {
        guard steps > 0 else { return start == 0 ? 1 : 0 }
        guard range.contains(start) else { return 0 }
        
        if let answer = dp[start]?[steps] {
            return answer
        }
        
        var answer = 0
        
        answer += numWays(start - 1, steps - 1, range, &dp)
        answer %= mod
        
        answer += numWays(start, steps - 1, range, &dp)
        answer %= mod
        
        answer += numWays(start + 1, steps - 1, range, &dp)
        answer %= mod
        
        dp[start, default: [:]][steps] = answer
        return answer
    }
}
