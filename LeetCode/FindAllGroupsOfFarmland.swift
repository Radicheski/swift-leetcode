//
//  FindAllGroupsOfFarmland.swift
//  https://leetcode.com/problems/find-all-groups-of-farmland/
//
//  Created by Erik Radicheski da Silva on 20/04/24.
//

import XCTest

final class FindAllGroupsOfFarmland: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findFarmland([[1, 0, 0], [0, 1, 1], [0, 1, 1]]), [[0, 0, 0, 0], [1, 1, 2, 2]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findFarmland([[1, 1], [1, 1]]), [[0, 0, 1, 1]])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findFarmland([[0]]), [])
    }
}

private class Solution {
    func findFarmland(_ land: [[Int]]) -> [[Int]] {
        var answer = [[Int]]()
        
        var visited = Set<[Int]>()
        
        for (i, row) in land.enumerated() {
            for (j, plot) in row.enumerated() where visited.contains([i, j]) == false {
                visited.insert([i, j])
                
                guard land[i][j] == 1  else { continue }
                
                var corners = [i, j, i, j]
                    
                for m in i ..< land.endIndex {
                    guard land[m][j] == 1 else { break }
                    
                    for n in j ..< land[m].endIndex where visited.contains([m, n]) == false  {
                        visited.insert([m, n])
                        
                        guard land[m][n] == 1  else { break }
                        
                        corners[2] = max(corners[2], m)
                        corners[3] = max(corners[3], n)
                    }
                }
                
                answer.append(corners)
            }
        }
        
        return answer
    }
}
