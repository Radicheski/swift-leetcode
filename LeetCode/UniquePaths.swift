//
//  UniquePaths.swift
//  https://leetcode.com/problems/unique-paths/
//
//  Created by Erik Radicheski da Silva on 26/08/22.
//

import XCTest

class UniquePaths: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.uniquePaths(3, 7), 28)
        XCTAssertEqual(solution.uniquePaths(3, 2), 3)
    }

}
 private class Solution {
     func uniquePaths(_ m: Int, _ n: Int) -> Int {
         var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
         
         for indexM in 1..<m {
             for indexN in 1..<n {
                 dp[indexM][indexN] = dp[indexM - 1][indexN] + dp[indexM][indexN - 1]
             }
         }
         
         return dp[m - 1][n - 1]
     }
 }
