//
//  LargestSubmatrixWithRearrangements.swift
//  https://leetcode.com/problems/largest-submatrix-with-rearrangements/
//
//  Created by Erik Radicheski da Silva on 26/11/23.
//

import XCTest

final class LargestSubmatrixWithRearrangements: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestSubmatrix([[0, 0, 1], [1, 1, 1], [1, 0, 1]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestSubmatrix([[1, 0, 1, 0, 1]]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.largestSubmatrix([[1, 1, 0], [1, 0, 1]]), 2)
    }
    
}

private class Solution {
    func largestSubmatrix(_ matrix: [[Int]]) -> Int {
        var matrix = matrix
        let n = matrix[0].count
        var answer = 0
        
        for i in matrix.indices {
            for j in matrix[i].indices where matrix[i][j] != 0 {
                guard i > 0 else { break }
                matrix[i][j] += matrix[i - 1][j]
            }
            
            let row = matrix[i].sorted()
            for j in row.indices {
                answer = max(answer, row[j] * (n  - j))
            }
        }
        
        return answer
    }
}
