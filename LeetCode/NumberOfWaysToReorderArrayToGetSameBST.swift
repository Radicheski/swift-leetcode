//
//  NumberOfWaysToReorderArrayToGetSameBST.swift
//  https://leetcode.com/problems/number-of-ways-to-reorder-array-to-get-same-bst/
//
//  Created by Erik Radicheski da Silva on 16/06/23.
//

import XCTest

final class NumberOfWaysToReorderArrayToGetSameBST: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numOfWays([2, 1, 3]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numOfWays([3, 4, 5, 1, 2]), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numOfWays([1, 2, 3]), 0)
    }

}

private class Solution {
    private let mod = 1_000_000_007
    
    func numOfWays(_ nums: [Int]) -> Int {
        var table = Array(repeating: Array(repeating: 0, count: nums.count), count: nums.count)
        
        for i in table.indices {
            table[i][0] = 1
            table[i][i] = 1
        }
        
        for i in table.indices where i > 1 {
            for j in 1 ..< i {
                table[i][j] = table[i - 1][j - 1] + table[i - 1][j]
                table[i][j] %= mod
            }
        }
        
        return (depthFirst(nums, table) - 1) % mod
    }
    
    private func depthFirst(_ nums: [Int], _ table: [[Int]]) -> Int {
        guard nums.count > 2 else { return 1 }
        
        var leftNodes = [Int]()
        var rightNodes = [Int]()
        
        for num in nums[1...] {
            if num < nums[0] {
                leftNodes.append(num)
            } else {
                rightNodes.append(num)
            }
        }
        
        let left = depthFirst(leftNodes, table) % mod
        let right = depthFirst(rightNodes, table) % mod
        
        return (((left * right) % mod) * table[nums.count - 1][leftNodes.count]) % mod
    }
}
