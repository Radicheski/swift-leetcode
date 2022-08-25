//
//  FibonacciNumber.swift
//  https://leetcode.com/problems/fibonacci-number/
//
//  Created by Erik Radicheski da Silva on 25/08/22.
//

import XCTest

class FibonacciNumber: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.fib(2), 1)
        XCTAssertEqual(solution.fib(3), 2)
        XCTAssertEqual(solution.fib(4), 3)
        
        XCTAssertEqual(solution.fib(30), 832040)
    }

}

private class Solution {
    func fib(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        
        return fib(n - 1) + fib(n - 2)
    }
}
