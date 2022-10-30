//
//  JumpGame.swift
//  https://leetcode.com/problems/jump-game/
//
//  Created by Erik Radicheski da Silva on 30/10/22.
//

import XCTest

final class JumpGame: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canJump([2, 3, 1, 1, 4]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canJump([3, 2, 1, 0, 4]))
    }

}

private class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var possible = nums.map { _ in false }
        possible[nums.endIndex - 1] = true

        for position in stride(from: nums.endIndex - 2, through: 0, by: -1) {
            guard nums[position] > 0 else { continue }
            
            for jump in 1 ... nums[position] where position + jump < nums.endIndex {
                let nextPosition = position + jump
                if possible[nextPosition] {
                    possible[position] = true
                    break
                }
            }
        }
        
        return possible[0]
    }
}
