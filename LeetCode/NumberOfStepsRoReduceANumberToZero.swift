//
//  NumberOfStepsRoReduceANumberToZero.swift
//  https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/
//
//  Created by Erik Radicheski da Silva on 14/08/22.
//

import XCTest

class NumberOfStepsRoReduceANumberToZero: XCTestCase {
    
    private let solution = Solution()

    func testExampleA() {
        XCTAssertEqual(solution.numberOfSteps(14), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfSteps(8), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numberOfSteps(123), 12)
    }

}

private class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var num = num
        var count = 0

        while num > 0 {
            if num % 2 == 0 {
                num /= 2
            } else {
                num -= 1
            }
            count += 1
        }

        return count
    }
}
