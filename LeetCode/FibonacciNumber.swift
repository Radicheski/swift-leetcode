//
//  FibonacciNumber.swift
//  https://leetcode.com/problems/fibonacci-number/
//
//  Created by Erik Radicheski da Silva on 25/08/22.
//

import XCTest

class FibonacciNumber: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.fib(2), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.fib(3), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.fib(4), 3)
    }

}

private class Solution {
    func fib(_ n: Int) -> Int {
        guard n > 1 else { return n }
        
        var previousResult = 0
        var result = 1
        
        for _ in 2 ... n {
            let sum = result + previousResult
            previousResult = result
            result = sum
        }
        
        return result
    }
    
}
