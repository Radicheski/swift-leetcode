//
//  MinimumOneBitOperationsToMakeIntegersZero.swift
//  https://leetcode.com/problems/minimum-one-bit-operations-to-make-integers-zero/
//
//  Created by Erik Radicheski da Silva on 30/11/23.
//

import XCTest

final class MinimumOneBitOperationsToMakeIntegersZero: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumOneBitOperations(3), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumOneBitOperations(6), 4)
    }

}

private class Solution {
    func minimumOneBitOperations(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        
        var k = 0
        var current = 1
        while 2 * current <= n {
            current *= 2
            k += 1
        }
        
        return (1 << (k + 1)) - 1 - minimumOneBitOperations(n ^ current)
    }
}
