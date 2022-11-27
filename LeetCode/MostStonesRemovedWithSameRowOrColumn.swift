//
//  MostStonesRemovedWithSameRowOrColumn.swift
//  https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/
//
//  Created by Erik Radicheski da Silva on 27/11/22.
//

import XCTest

final class MostStonesRemovedWithSameRowOrColumn: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.removeStones([[0, 0], [0, 1], [1, 0], [1, 2], [2, 1], [2, 2]]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.removeStones([[0, 0], [0, 2], [1, 1], [2, 0], [2, 2]]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.removeStones([[0, 0]]), 0)
    }
    
}

private class Solution {
    func removeStones(_ stones: [[Int]]) -> Int {
        var islands = 0
        var visited = Set<Int>()
        
        for index in 0 ..< stones.endIndex {
            if visited.contains(index) { continue }
            islands += 1
            dfs(index, stones, &visited)
        }
        
        return stones.count - islands
    }
    
    private func dfs(_ index: Int, _ stones: [[Int]], _ visited: inout Set<Int>) {
        visited.insert(index)
        
        for nextIndex in 0 ..< stones.endIndex {
            if visited.contains(nextIndex) { continue }
            if stones[index][0] == stones[nextIndex][0]
                || stones[index][1] == stones[nextIndex][1] {
                dfs(nextIndex, stones, &visited)
            }
        }
    }
}
