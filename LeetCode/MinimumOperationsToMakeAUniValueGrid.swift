//
//  MinimumOperationsToMakeAUniValueGrid.swift
//  https://leetcode.com/problems/minimum-operations-to-make-a-uni-value-grid/
//
//  Created by Erik Radicheski da Silva on 26/03/25.
//

import XCTest

final class MinimumOperationsToMakeAUniValueGrid: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations([[2, 4], [6, 8]], 2), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations([[1, 5], [2, 3]], 1), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minOperations([[1, 2], [3, 4]], 2), -1)
    }
    
}

private class Solution {
    func minOperations(_ grid: [[Int]], _ x: Int) -> Int {
        let grid = grid.flatMap { $0 }.sorted()
        
        var median = grid[grid.endIndex / 2]
        var count = 0
        
        for number in grid {
            guard number % x == median % x else { return -1 }
            
            count += abs(median - number) / x
        }
        
        return count
    }
}
