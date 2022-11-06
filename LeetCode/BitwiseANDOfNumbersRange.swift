//
//  BitwiseANDOfNumbersRange.swift
//  https://leetcode.com/problems/bitwise-and-of-numbers-range/
//
//  Created by Erik Radicheski da Silva on 06/11/22.
//

import XCTest

final class BitwiseANDOfNumbersRange: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.rangeBitwiseAnd(5, 7), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.rangeBitwiseAnd(0, 0), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.rangeBitwiseAnd(1, 2147483647), 0)
    }

}

private class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        guard left > 0 && right > 0 else { return 0 }
        var result = right
        
        while result > left {
            result &= result - 1
        }
        
        return result
    }
}
