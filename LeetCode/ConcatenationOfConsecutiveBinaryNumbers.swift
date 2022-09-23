//
//  ConcatenationOfConsecutiveBinaryNumbers.swift
//  https://leetcode.com/problems/concatenation-of-consecutive-binary-numbers/
//
//  Created by Erik Radicheski da Silva on 23/09/22.
//

import XCTest

final class ConcatenationOfConsecutiveBinaryNumbers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.concatenatedBinary(1), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.concatenatedBinary(3), 27)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.concatenatedBinary(12), 505379714)
    }
    
    func testPerformance() {
        measure {
            for n in 1 ... 1000 {
                let _ = solution.concatenatedBinary(n)
            }
        }
        
    }
}

private class Solution {
    func concatenatedBinary(_ n: Int) -> Int {
        let mod = 1000000007
        
        var result = 0
        
        for i in 1 ... n {
            let string = String(i, radix: 2)
            for digit in string {
                result = result * 2 % mod
                if digit == "1" { result += 1 }
            }
        }
        
        return result
    }
}
