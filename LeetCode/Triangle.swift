//
//  Triangle.swift
//  https://leetcode.com/problems/triangle/
//
//  Created by Erik Radicheski da Silva on 25/09/22.
//

import XCTest

final class Triangle: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumTotal([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]), 11)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumTotal([[-10]]), -10)
    }

}

private class Solution {
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 1 else { return triangle[0][0] }
        
        let rowCount = triangle.count
        
        var sum = [[Int]]()
        
        sum.append(triangle[rowCount - 1])
        
        for reverseRow in 2 ... rowCount {
            var rowSum = [Int]()
            for column in 0 ..< triangle[rowCount - reverseRow].count {
                var columnSum = triangle[rowCount - reverseRow][column]
                columnSum += min(sum[0][column], sum[0][column + 1])
                rowSum.append(columnSum)
            }
            sum.insert(rowSum, at: 0)
        }
        
        return sum[0][0]
    }
    
}
