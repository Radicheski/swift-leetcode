//
//  TheKWeakestRowsInAMatrix.swift
//  https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/
//
//  Created by Erik Radicheski da Silva on 13/08/22.
//

import XCTest

class TheKWeakestRowsInAMatrix: XCTestCase {

    func test() {
        let solution = Solution()
        var mat: [[Int]]

        mat = [[1,1,0,0,0],
               [1,1,1,1,0],
               [1,0,0,0,0],
               [1,1,0,0,0],
               [1,1,1,1,1]]
        XCTAssertEqual([2, 0, 3], solution.kWeakestRows(mat, 3))

        mat = [[1,0,0,0],
               [1,1,1,1],
               [1,0,0,0],
               [1,0,0,0]]
        XCTAssertEqual([0, 2], solution.kWeakestRows(mat, 2))

    }

}

private class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let strength = mat.reduce(into: []) { $0.append($1.reduce(into: 0) { $0 += $1 }) }

        var result = [Int]()

        result = strength.enumerated().sorted {
            $0.element < $1.element || ($0.element == $1.element && $0.offset < $1.offset )
        }.map {
            $0.offset
        }

        return result.dropLast(result.count - k)
    }
}
