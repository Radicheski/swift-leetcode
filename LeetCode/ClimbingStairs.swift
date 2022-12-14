//
//  ClimbingStairs.swift
//  https://leetcode.com/problems/climbing-stairs/
//
//  Created by Erik Radicheski da Silva on 25/08/22.
//

import XCTest

class ClimbingStairs: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.climbStairs(2), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.climbStairs(3), 3)
    }

}

private class Solution {
    
    func climbStairs(_ n: Int) -> Int {
        return (0..<n).map { fib($0) }.reduce(into: 1, +=)
    }
    
    private let Phi = (sqrt(5) + 1) / 2
    private let phi = (sqrt(5) - 1) / 2
   
    func fib(_ n: Int) -> Int {
        let n = Double(n)
        
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        
        return Int((pow(Phi, n) - pow(-phi, n)) / sqrt(5))
    }
}
