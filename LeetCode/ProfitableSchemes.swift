//
//  ProfitableSchemes.swift
//  https://leetcode.com/problems/profitable-schemes/
//
//  Created by Erik Radicheski da Silva on 21/04/23.
//

import XCTest

final class ProfitableSchemes: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.profitableSchemes(5, 3, [2, 2], [2, 3]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.profitableSchemes(10, 5, [2, 3, 5], [6, 7, 8]), 7)
   }

}

private class Solution {
    private let mod = 1000000007
    
    func profitableSchemes(_ n: Int, _ minProfit: Int, _ group: [Int], _ profit: [Int]) -> Int {
        var memo = (0 ... 100).map { _ in
            (0 ... 100).map { _ in
                (0 ... 100).map { _ in -1}
            }
        }
        
        return find(0, 0, 0, n, minProfit, group, profit, &memo)
    }
    
    private func find(_ position: Int, _ count: Int, _ profit: Int, _ n: Int, _ minimumProfit: Int,
                      _ group: [Int], _ profits: [Int], _ memo: inout [[[Int]]]) -> Int {
        guard position != group.count else { return profit >= minimumProfit ? 1 : 0 }
        
        guard memo[position][count][profit] == -1 else { return memo[position][count][profit] }
        
        var possibleWays = find(position + 1, count, profit, n, minimumProfit, group, profits, &memo)
        if count + group[position] <= n {
            let nextCount = count + group[position]
            let nextProfit = min(minimumProfit, profit + profits[position])
            possibleWays += find(position + 1, nextCount, nextProfit, n, minimumProfit, group, profits, &memo)
        }
        
        memo[position][count][profit] = possibleWays % mod
        return memo[position][count][profit]
    }
}
