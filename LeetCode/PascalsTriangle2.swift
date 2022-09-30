//
//  PascalsTriangle2.swift
//  https://leetcode.com/problems/pascals-triangle-ii/
//
//  Created by Erik Radicheski da Silva on 30/09/22.
//

import XCTest

final class PascalsTriangle2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getRow(3), [1, 3, 3, 1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getRow(0), [1])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.getRow(1), [1, 1])
    }

}

private class Solution {
    
    func getRow(_ rowIndex: Int) -> [Int] {
        var result = [1]
        
        while result.count < rowIndex + 1 {
            let previousRow = result
            
            for index in 1 ..< previousRow.count {
                result[index] = previousRow[index] + previousRow[index - 1]
            }
            
            result.append(1)
        }
        
        return result
    }
    
}
