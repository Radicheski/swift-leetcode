//
//  RunningSumOf1dArray.swift
//  https://leetcode.com/problems/running-sum-of-1d-array/
//
//  Created by Erik Radicheski da Silva on 16/08/22.
//

import XCTest

class RunningSumOf1dArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual([1, 3, 6, 10], solution.runningSum([1, 2, 3, 4]))
    }
    
    func testExampleB() {
        XCTAssertEqual([1, 2, 3, 4, 5], solution.runningSum([1, 1, 1, 1, 1]))
    }
    
    func testExampleC() {
        XCTAssertEqual([3, 4, 6, 16, 17], solution.runningSum([3, 1, 2, 10, 1]))
    }

}

private class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var result = [Int]()

        var sum = 0
        for number in nums {
            sum += number
            result.append(sum)
        }

        return result
    }
}
