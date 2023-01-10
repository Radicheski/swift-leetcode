//
//  NextGreaterElement2.swift
//  https://leetcode.com/problems/next-greater-element-ii/
//
//  Created by Erik Radicheski da Silva on 10/01/23.
//

import XCTest

final class NextGreaterElement2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.nextGreaterElements([1, 2, 1]), [2, -1, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.nextGreaterElements([1, 2, 3, 4, 3]), [2, 3, 4, -1, 4])
    }

}

private class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var stack = [Int]()
        var result = Array(repeating: -1, count: nums.count)
        
        for i in stride(from: 2 * nums.count - 1, through: 0, by: -1) {
            while stack.isEmpty == false && nums[stack.last!] <= nums [i % nums.count] {
                stack.removeLast()
            }
            result[i % nums.count] = stack.isEmpty ? -1 : nums[stack.last!]
            stack.append(i % nums.count)
        }
        
        return result
    }
}
