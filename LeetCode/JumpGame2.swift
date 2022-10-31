//
//  JumpGame2.swift
//  https://leetcode.com/problems/jump-game-ii/
//
//  Created by Erik Radicheski da Silva on 31/10/22.
//

import XCTest

final class JumpGame2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.jump([2, 3, 1, 1, 4]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.jump([2, 3, 0, 1, 4]), 2)
    }

}

private class Solution {
    
    private let maxJumps = 1_000_000
    
    func jump(_ nums: [Int]) -> Int {
        var jumps = nums.map { _ in 0 }
        
        for i in stride(from: nums.endIndex - 2, through: 0, by: -1) {
            if nums[i] == 0 {
                jumps[i] = maxJumps
                continue
            }
            
            var minJumps = Int.max
            
            for j in 1 ... nums[i] {
                guard i + j < nums.endIndex else { break }
                var thisJump = jumps[i + j] + 1
                minJumps = min(thisJump, minJumps)
            }
            
            jumps[i] = minJumps
        }
        
        return jumps[0]
    }
}
