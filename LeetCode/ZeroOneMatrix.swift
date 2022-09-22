//
//  ZeroOneMatrix.swift
//  https://leetcode.com/problems/01-matrix/
//
//  Created by Erik Radicheski da Silva on 22/09/22.
//

import XCTest

final class ZeroOneMatrix: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
        let expectedOutput = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
        XCTAssertEqual(solution.updateMatrix(input), expectedOutput)
    }
    
    func testExampleB() {
        let input = [[0, 0, 0], [0, 1, 0], [1, 1, 1]]
        let expectedOutput = [[0, 0, 0], [0, 1, 0], [1, 2, 1]]
        XCTAssertEqual(solution.updateMatrix(input), expectedOutput)
    }
    
}

private class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let zeros = findZeros(mat)
        
        var result = mat.map { $0.map { _ in 0 } }
        
        for m in 0 ..< mat.count {
            for n in 0 ..< mat[m].count {
                let distance = findMinimumDistance(zeros, (m, n))
                result[m][n] = distance
            }
        }
        
        return result
    }
    
    private func findMinimumDistance(_ zeros: [(row: Int, column: Int)], _ position: (row: Int, column: Int)) -> Int {
        return zeros.map { abs($0.row - position.row) + abs($0.column - position.column) }
            .min() ?? .min
    }
    
    private func findZeros(_ mat: [[Int]]) -> [(row: Int, column: Int)] {
        var result = [(row: Int, column: Int)]()
        
        for m in 0 ..< mat.count {
            for n in 0 ..< mat[m].count {
                result.append((m, n))
            }
        }
        
        result.removeAll { mat[$0.row][$0.column] != 0 }
        
        return result
    }
}
