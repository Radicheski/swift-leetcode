//
//  MinimumASCIIDeleteSumForTwoStrings.swift
//  https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings/
//
//  Created by Erik Radicheski da Silva on 31/07/23.
//

import XCTest

final class MinimumASCIIDeleteSumForTwoStrings: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumDeleteSum("sea", "eat"), 231)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumDeleteSum("delete", "leet"), 403)
    }

}

private class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let s1 = s1.map(asciiValue)
        let s2 = s2.map(asciiValue)
        
        var dp = [Int: [Int: Int]]()
        
        return computeCost(s1, s2, s1.endIndex - 1, s2.endIndex - 1, &dp)
    }
    
    private func computeCost(_ s1: [Int], _ s2: [Int], _ i: Int, _ j: Int, _ dp: inout [Int: [Int: Int]]) -> Int {
        if let answer = dp[i]?[j] {
            return answer
        }
        
        if i < 0 {
            var deleteCost = 0
            var pointer = j
            while pointer >= 0 {
                deleteCost += s2[pointer]
                pointer -= 1
            }
            dp[i, default: [:]][j] = deleteCost
            return deleteCost
        }
        
        if j < 0 {
            var deleteCost = 0
            var pointer = i
            while pointer >= 0 {
                deleteCost += s1[pointer]
                pointer -= 1
            }
            dp[i, default: [:]][j] = deleteCost
            return deleteCost
        }
        
        if s1[i] == s2[j] {
            let cost = computeCost(s1, s2, i - 1, j - 1, &dp)
            dp[i, default: [:]][j] = cost
            return cost
        } else {
            let cost = min(s1[i] + computeCost(s1, s2, i - 1, j, &dp),
                           s2[j] + computeCost(s1, s2, i, j - 1, &dp),
                           s1[i] + s2[j] + computeCost(s1, s2, i - 1, j - 1, &dp))
            dp[i, default: [:]][j] = cost
            return cost
        }
    }
    
    private func asciiValue(_ c: Character) -> Int {
        Int(c.asciiValue!)
    }
}
