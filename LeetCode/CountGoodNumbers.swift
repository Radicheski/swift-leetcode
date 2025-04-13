//
//  CountGoodNumbers.swift
//  https://leetcode.com/problems/count-good-numbers/
//
//  Created by Erik Radicheski da Silva on 13/04/25.
//

import XCTest

final class CountGoodNumbers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countGoodNumbers(1), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countGoodNumbers(4), 400)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countGoodNumbers(50), 564908303)
    }
    
}

private class Solution {
    private let mod = 1_000_000_007

    func countGoodNumbers(_ n: Int) -> Int {
        let evenCount = (n + 1) / 2
        let oddCount = n / 2
        
        let pow5 = modPow(5, evenCount)
        let pow4 = modPow(4, oddCount)
        
        return (pow5 * pow4) % mod
    }
    
    private func modPow(_ base: Int, _ exp: Int) -> Int {
        var result = 1
        var b = base
        var e = exp
        
        while e > 0 {
            if e % 2 == 1 {
                result *= b
                result %= mod
            }
            b = (b * b) % mod
            e /= 2
        }
        
        return result
    }
}
