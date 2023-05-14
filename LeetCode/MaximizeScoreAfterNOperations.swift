//
//  MaximizeScoreAfterNOperations.swift
//  https://leetcode.com/problems/maximize-score-after-n-operations/
//
//  Created by Erik Radicheski da Silva on 14/05/23.
//

import XCTest

final class MaximizeScoreAfterNOperations: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxScore([1, 2]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxScore([3, 4, 6, 8]), 11)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxScore([1, 2, 3, 4, 5, 6]), 14)
    }

}

private class Solution {
    func maxScore(_ nums: [Int]) -> Int {
        var memo: [Int?] = Array(repeating: nil, count: 1 << nums.count)
        return backtrack(nums, 0, 0, &memo)
    }
    
    private func backtrack(_ nums: [Int], _ mask: Int, _ pairsPicked: Int, _ memo: inout [Int?]) -> Int {
        guard 2 * pairsPicked < nums.count else { return 0 }
        
        if let result = memo[mask] { return result }
        
        var maxScore = 0
        
        for firstIndex in 0 ..< nums.endIndex {
            for secondIndex in firstIndex + 1 ..< nums.endIndex {
                guard (mask >> firstIndex) & 1 == 0 && (mask >> secondIndex) & 1 == 0 else { continue }
                
                let newMask = mask | (1 << firstIndex) | (1 << secondIndex)
                
                let currentScore = (pairsPicked + 1) * gcd(nums[firstIndex], nums[secondIndex])
                let remainingScore = backtrack(nums, newMask, pairsPicked + 1, &memo)
                
                maxScore = max(maxScore, currentScore + remainingScore)
            }
        }
        
        memo[mask] = maxScore
        return maxScore
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        guard b > 0 else { return a }
        return gcd(b, a % b)
    }
}
