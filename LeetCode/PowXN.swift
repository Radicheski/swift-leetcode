//
//  PowXN.swift
//  https://leetcode.com/problems/powx-n/
//
//  Created by Erik Radicheski da Silva on 24/07/23.
//

import XCTest

final class PowXN: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.myPow(2, 10), 1024)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.myPow(2.1, 3), 9.261)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.myPow(2, -2), 0.25)
    }

}

private class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard x != 0 else { return 0 }
        guard x != 1 else { return 1 }
        guard n != 0 else { return 1 }
        guard n != 1 else { return x }
        guard n != -1 else { return 1 / x }
        
        if n.isMultiple(of: 2) {
            return myPow(x * x, n / 2)
        } else {
            return x * myPow(x * x, (n - 1) / 2)
        }
    }
}
