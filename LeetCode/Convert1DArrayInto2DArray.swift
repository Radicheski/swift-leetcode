//
//  Convert1DArrayInto2DArray.swift
//  https://leetcode.com/problems/convert-1d-array-into-2d-array/
//
//  Created by Erik Radicheski da Silva on 01/09/24.
//

import XCTest

final class Convert1DArrayInto2DArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.construct2DArray([1, 2, 3, 4], 2, 2), [[1, 2], [3, 4]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.construct2DArray([1, 2, 3], 1, 3), [[1, 2, 3]])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.construct2DArray([1, 2], 1, 1), [])
    }
    
}

private class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        guard original.count == m * n else { return [] }
        
        var answer = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for (i, num) in original.enumerated() {
            answer[i / n][i % n] = num
        }
        
        return answer
    }
}
