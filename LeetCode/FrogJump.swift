//
//  FrogJump.swift
//  https://leetcode.com/problems/frog-jump/
//
//  Created by Erik Radicheski da Silva on 27/08/23.
//

import XCTest

final class FrogJump: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canCross([0, 1, 3, 5, 6, 8, 12, 17]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canCross([0, 1, 2, 3, 4, 8, 9, 11]))
    }

}

private class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        let lastStone = stones.last!
        let stones = Set(stones)
        
        var dp = [Int: [Int: Bool]]()
        
        return canCross(stones, lastStone, 0, 1, &dp)
    }
    
    private func canCross(_ stones: Set<Int>, _ lastStone: Int, _ start: Int,
                          _ jumpSize: Int, _ dp: inout [Int: [Int: Bool]]) -> Bool {
        if let answer = dp[start]?[jumpSize] {
            return answer
        }
        
        guard start != lastStone else { return true }
        guard jumpSize > 0 else { return false }
        guard stones.contains(start) else { return false }
        
        var answer = false
        
        let nextStart = start + jumpSize
        
        answer = answer || canCross(stones, lastStone, nextStart, jumpSize - 1, &dp)
        answer = answer || canCross(stones, lastStone, nextStart, jumpSize, &dp)
        answer = answer || canCross(stones, lastStone, nextStart, jumpSize + 1, &dp)
        
        dp[start, default: [:]][jumpSize] = answer
        return answer
    }
}
