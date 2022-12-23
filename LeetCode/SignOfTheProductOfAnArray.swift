//
//  SignOfTheProductOfAnArray.swift
//  https://leetcode.com/problems/sign-of-the-product-of-an-array/
//
//  Created by Erik Radicheski da Silva on 23/12/22.
//

import XCTest

final class SignOfTheProductOfAnArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.arraySign([-1, -2, -3, -4, 3, 2, 1]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.arraySign([1, 5, 0, 2, -3]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.arraySign([-1, 1, -1, 1, -1]), -1)
    }

}

private class Solution {
    func arraySign(_ nums: [Int]) -> Int {
        guard nums.firstIndex(of: 0) == nil else { return 0 }
        return nums.filter( { $0 < 0 } ).count.isMultiple(of: 2) ? 1 : -1
    }
}
