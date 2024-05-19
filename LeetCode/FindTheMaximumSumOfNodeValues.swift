//
//  FindTheMaximumSumOfNodeValues.swift
//  https://leetcode.com/problems/find-the-maximum-sum-of-node-values/
//
//  Created by Erik Radicheski da Silva on 19/05/24.
//

import XCTest

final class FindTheMaximumSumOfNodeValues: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumValueSum([1, 2, 1], 3, [[0, 1], [0, 2]]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumValueSum([2, 3], 7, [[0, 1]]), 9)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumValueSum([7, 7, 7, 7, 7, 7], 3, [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5]]), 42)
    }
    
}

private class Solution {
    func maximumValueSum(_ nums: [Int], _ k: Int, _ edges: [[Int]]) -> Int {
        var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: 2), count: nums.count)
        return maxSumOfNodes(0, 1, nums, k, &memo)
    }
    
    private func maxSumOfNodes(_ index: Int, _ isEven: Int, _ nums: [Int],
                               _ k: Int, _ memo: inout [[Int?]]) -> Int {
        guard index < nums.endIndex else { return isEven == 1 ? 0 : .min }
        
        if let answer = memo[index][isEven] {
            return answer
        }
        
        let noXorDone = nums[index] + maxSumOfNodes(index + 1, isEven, nums, k, &memo)
        let xorDone = (nums[index] ^ k) + maxSumOfNodes(index + 1, isEven ^ 1, nums, k, &memo)
        
        memo[index][isEven] = max(xorDone, noXorDone)
        return max(xorDone, noXorDone)
    }
}
