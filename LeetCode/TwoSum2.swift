//
//  TwoSum2.swift
//  https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
//
//  Created by Erik Radicheski da Silva on 16/09/22.
//

import XCTest

final class TwoSum2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.twoSum([2, 7, 11, 15], 9), [1, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.twoSum([2, 3, 4], 6), [1, 3])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.twoSum([-1, 0], -1), [1, 2])
    }
    
}

private class Solution {
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        for indexA in 0 ..< numbers.count {
            for indexB in indexA + 1 ..< numbers.count {
                if numbers[indexA] + numbers[indexB] == target {
                    return [indexA + 1, indexB + 1]
                }
            }
        }
        return []
    }
    
}
