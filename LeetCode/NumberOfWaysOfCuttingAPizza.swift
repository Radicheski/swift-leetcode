//
//  NumberOfWaysOfCuttingAPizza.swift
//  https://leetcode.com/problems/number-of-ways-of-cutting-a-pizza/
//
//  Created by Erik Radicheski da Silva on 31/03/23.
//

import XCTest

final class NumberOfWaysOfCuttingAPizza: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.ways(["A..", "AAA", "..."], 3), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.ways(["A..", "AA.", "..."], 3), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.ways(["A..", "A..", "..."], 1), 1)
    }

}

private class Solution {
    func ways(_ pizza: [String], _ k: Int) -> Int {
        let pizza = pizza.map { Array($0) }
        
        let row_count = pizza.count
        let column_count = pizza[0].count
        
        var apples = Array(repeating: Array(repeating: 0, count: column_count + 1), count: row_count + 1)
        
        var dp = Array(repeating: pizza.map { $0.map { _ in 0 } }, count: k)
        
        for row in stride(from: row_count - 1, through: 0, by: -1) {
            for column in stride(from: column_count - 1, through: 0, by: -1) {
                apples[row][column] = (pizza[row][column] == "A" ? 1 : 0)
                apples[row][column] += apples[row + 1][column] + apples[row][column + 1]
                apples[row][column] -= apples[row + 1][column + 1]
                
                dp[0][row][column] = apples[row][column] > 0 ? 1 : 0
            }
        }
        
        let mod = 1000000007
        
        for remain in 1 ..< k {
            for row in 0 ..< row_count {
                for column in 0 ..< column_count {
                    for nextRow in row + 1 ..< row_count {
                        if apples[row][column] > apples[nextRow][column] {
                            dp[remain][row][column] += dp[remain - 1][nextRow][column]
                            dp[remain][row][column] %= mod
                        }
                    }
                    for nextColumn in column + 1 ..< column_count {
                        if apples[row][column] > apples[row][nextColumn] {
                            dp[remain][row][column] += dp[remain - 1][row][nextColumn]
                            dp[remain][row][column] %= mod
                        }
                    }
                }
            }
        }
        
        return dp[k - 1][0][0]
    }
}
