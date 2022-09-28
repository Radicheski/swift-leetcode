//
//  MajorityElement.swift
//  https://leetcode.com/problems/majority-element/
//
//  Created by Erik Radicheski da Silva on 28/09/22.
//

import XCTest

final class MajorityElement: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.majorityElement([3, 2, 3]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.majorityElement([2, 2, 1, 1, 1, 2, 2]), 2)
    }

}

private class Solution {
    
    func majorityElement(_ nums: [Int]) -> Int {
        let tuples = nums.map { ($0, 1) }
        let dictionary = Dictionary(tuples, uniquingKeysWith: +)
        return dictionary.sorted { $0.value > $1.value }.first!.key
    }
    
}
