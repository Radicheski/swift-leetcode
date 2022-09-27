//
//  SingleNumber.swift
//  https://leetcode.com/problems/single-number/
//
//  Created by Erik Radicheski da Silva on 27/09/22.
//

import XCTest

final class SingleNumber: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.singleNumber([2, 2, 1]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.singleNumber([4, 1, 2, 1, 2]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.singleNumber([1]), 1)
    }

}

private class Solution {
    
    func singleNumber(_ nums: [Int]) -> Int {
        let count = nums.map { ($0, 1) }
        let dict = Dictionary(count, uniquingKeysWith: +)
        return dict.first { $0.value == 1 }!.key
    }
    
}
