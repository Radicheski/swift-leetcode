//
//  SingleNumber2.swift
//  https://leetcode.com/problems/single-number-ii/
//
//  Created by Erik Radicheski da Silva on 04/07/23.
//

import XCTest

final class SingleNumber2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.singleNumber([2, 2, 3, 2]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.singleNumber([0, 1, 0, 1, 0, 1, 99]), 99)
    }

}

private class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0
        var b = 0
        
        for num in nums {
            a = ~b & (a ^ num)
            b = ~a & (b ^ num)
        }
        
        return a
    }
}
