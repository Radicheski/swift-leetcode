//
//  UniqueBinarySearchTrees.swift
//  https://leetcode.com/problems/unique-binary-search-trees/
//
//  Created by Erik Radicheski da Silva on 09/12/22.
//

import XCTest

final class UniqueBinarySearchTrees: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numTrees(3), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numTrees(1), 1)
    }

}

private class Solution {
    func numTrees(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        
        var dp = [1, 1]
        
        for i in 2 ... n {
            if i == dp.endIndex { dp.append(0) }
            for j in 1 ... i {
                dp[i] += dp[j - 1] * dp[i - j]
            }
        }
        
        return dp[n]
    }
}
