//
//  MajorityElement2.swift
//  https://leetcode.com/problems/majority-element-ii/
//
//  Created by Erik Radicheski da Silva on 05/10/23.
//

import XCTest

final class MajorityElement2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.majorityElement([3, 2, 3]), [3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.majorityElement([1]), [1])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.majorityElement([1, 2]), [1, 2])
    }
    
}

private class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var frequencies = [Int: Int]()
        
        for num in nums {
            frequencies[num, default: 0] += 1
        }
        
        return frequencies.filter { $0.value > nums.count / 3 }.map { $0.key }
    }
}
