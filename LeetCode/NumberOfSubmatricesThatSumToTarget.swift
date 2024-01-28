//
//  NumberOfSubmatricesThatSumToTarget.swift
//  https://leetcode.com/problems/number-of-submatrices-that-sum-to-target/
//
//  Created by Erik Radicheski da Silva on 28/01/24.
//

import XCTest

final class NumberOfSubmatricesThatSumToTarget: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numSubmatrixSumTarget([[0, 1, 0], [1, 1, 1], [0, 1, 0]], 0), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numSubmatrixSumTarget([[1, -1], [-1, 1]], 0), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numSubmatrixSumTarget([[904]], 0), 0)
    }
    
}

private class Solution {
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        var count = 0
        
        for i in matrix.indices {
            var prefix = Array(repeating: 0, count: matrix[0].count)
            
            for j in i ..< matrix.endIndex {
                var sumFrequency = [0: 1]
                var sum = 0
                
                for k in matrix[j].indices {
                    sum += matrix[j][k]
                    prefix[k] += sum
                    
                    count += sumFrequency[prefix[k] - target, default: 0]
                    sumFrequency[prefix[k], default: 0] += 1
                }
            }
        }
        
        return count
    }
}
