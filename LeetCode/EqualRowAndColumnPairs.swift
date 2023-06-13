//
//  EqualRowAndColumnPairs.swift
//  https://leetcode.com/problems/equal-row-and-column-pairs/
//
//  Created by Erik Radicheski da Silva on 13/06/23.
//

import XCTest

final class EqualRowAndColumnPairs: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.equalPairs([[3, 2, 1], [1, 7, 6], [2, 7, 7]]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.equalPairs([[3, 1, 2, 2], [1, 4, 4, 5], [2, 4, 2, 2], [2, 4, 2, 2]]), 3)
    }
}

private class Solution {
    func equalPairs(_ grid: [[Int]]) -> Int {
        var rows = [Int: [Int]]()
        var columns = [Int: [Int]]()
        
        for i in grid.indices {
            rows[grid[i][0], default: []].append(i)
            columns[grid[0][i], default: []].append(i)
        }
        
        var answer = 0
        
        for (firstNumber, rowList) in rows {
            guard let columnList = columns[firstNumber] else { continue }
            
            for row in rowList {
                for column in columnList {
                    var count = 0
                    
                    for i in grid.indices {
                        if grid[row][i] == grid[i][column] {
                            count += 1
                        }
                    }
                    
                    if count == grid.count {
                        answer += 1
                    }
                }
            }
        }
        
        return answer
    }
}
