//
//  PerfectSquares.swift
//  https://leetcode.com/problems/perfect-squares/
//
//  Created by Erik Radicheski da Silva on 19/12/22.
//

import XCTest

final class PerfectSquares: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numSquares(12), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numSquares(13), 2)
    }
}

private class Solution {
    func numSquares(_ n: Int) -> Int {
        var results = [Int](repeating: .max, count: n + 1)
        results[0] = 0
        
        for i in 1 ... n {
            var minimum = Int.max
            var j = 1
            while i - j * j >= 0 {
                minimum = min(minimum, results[i - j * j] + 1)
                j += 1
            }
            results[i] = minimum
        }
        
        return results[n]
    }
}
