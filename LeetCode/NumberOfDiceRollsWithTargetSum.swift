//
//  NumberOfDiceRollsWithTargetSum.swift
//  https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/
//
//  Created by Erik Radicheski da Silva on 26/12/23.
//

import XCTest

final class NumberOfDiceRollsWithTargetSum: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numRollsToTarget(1, 6, 3), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numRollsToTarget(2, 6, 7), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numRollsToTarget(30, 30, 500), 222616187)
    }

}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        var memo = [Int: [Int: Int]]()
        return numRollsToTarget(n, k, target, &memo)
    }
    
    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int, _ memo: inout [Int: [Int: Int]]) -> Int {
        guard target > 0 else { return 0 }
        guard n > 1 else { return target > k ? 0 : 1 }
        
        if let answer = memo[n]?[target] {
            return answer
        }
        
        var answer = 0
        
        for i in 1 ... k {
            answer += numRollsToTarget(n - 1, k, target - i, &memo)
            answer %= mod
        }
        
        memo[n, default: [:]][target] = answer
        return answer
    }
}
