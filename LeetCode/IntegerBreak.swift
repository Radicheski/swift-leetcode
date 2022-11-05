//
//  IntegerBreak.swift
//  https://leetcode.com/problems/integer-break/
//
//  Created by Erik Radicheski da Silva on 05/11/22.
//

import XCTest

final class IntegerBreak: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.integerBreak(2), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.integerBreak(10), 36)
    }
    
}

private class Solution {
    func integerBreak(_ n: Int) -> Int {
        guard n > 3 else { return n - 1 }
        
        var n = n
        var result = 1
        while n > 4 {
            n -= 3
            result *= 3
        }
        
        return n * result
    }
}
