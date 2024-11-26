//
//  FindChampion2.swift
//  https://leetcode.com/problems/find-champion-ii/
//
//  Created by Erik Radicheski da Silva on 26/11/24.
//

import XCTest

final class FindChampion2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findChampion(3, [[0, 1], [1, 2]]), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findChampion(4, [[0, 2], [1, 3], [1, 2]]), -1)
    }
    
}

private class Solution {
    func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
        var teams = Set<Int>(0 ..< n)
        
        for edge in edges {
            teams.remove(edge[1])
        }
        
        return teams.count == 1 ? teams.first! : -1
    }
}
