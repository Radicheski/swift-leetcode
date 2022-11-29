//
//  NthTribonacciNumber.swift
//  https://leetcode.com/problems/n-th-tribonacci-number/
//
//  Created by Erik Radicheski da Silva on 29/11/22.
//

import XCTest

final class NthTribonacciNumber: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.tribonacci(4), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.tribonacci(25), 1_389_537)
    }
    
}

private class Solution {
    func tribonacci(_ n: Int) -> Int {
        guard n != 0 else { return 0 }
        guard n > 2 else { return 1 }
        
        var result = [0, 1, 1]
        
        for _ in 3 ... n {
            let sum = result[0] + result[1] + result[2]
            result[0] = result[1]
            result[1] = result[2]
            result[2] = sum
        }
        
        return result[2]
    }
}
