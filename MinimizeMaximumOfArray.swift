//
//  MinimizeMaximumOfArray.swift
//  https://leetcode.com/problems/minimize-maximum-of-array/
//
//  Created by Erik Radicheski da Silva on 05/04/23.
//

import XCTest

final class MinimizeMaximumOfArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimizeArrayValue([3, 7, 1, 6]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimizeArrayValue([10, 1]), 10)
    }

}

private class Solution {
    func minimizeArrayValue(_ nums: [Int]) -> Int {
        var result = 0
        var preffixSum = 0
        
        for (index, num) in nums.enumerated() {
            preffixSum += num
            result = max(result, (preffixSum + index) / (index + 1))
        }
        
        return result
    }
}
