//
//  ZigzagConversion.swift
//  https://leetcode.com/problems/zigzag-conversion/
//
//  Created by Erik Radicheski da Silva on 03/02/23.
//

import XCTest

final class ZigzagConversion: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.convert("PAYPALISHIRING", 3), "PAHNAPLSIIGYIR")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.convert("PAYPALISHIRING", 4), "PINALSIGYAHRPI")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.convert("A", 1), "A")
    }

}

private class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        let s = Array(s)
        
        var result = [Character]()
        
        let charactersInSection = 2 * (numRows - 1)
        
        for currentRow in 0 ..< numRows {
            var index = currentRow
            
            while s.indices.contains(index) {
                result.append(s[index])
                
                if currentRow != 0 && currentRow != numRows - 1 {
                    let charactersInBetween = charactersInSection - 2 * currentRow
                    let secondIndex = index + charactersInBetween
                    
                    if s.indices.contains(secondIndex) {
                        result.append(s[secondIndex])
                    }
                }
                
                index += charactersInSection
            }
        }
        
        return String(result)
    }
}
