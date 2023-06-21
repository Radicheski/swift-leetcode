//
//  MinimumCostToMakeArrayEqual.swift
//  https://leetcode.com/problems/minimum-cost-to-make-array-equal/description/
//
//  Created by Erik Radicheski da Silva on 21/06/23.
//

import XCTest

final class MinimumCostToMakeArrayEqual: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minCost([1, 3, 5, 2], [2, 3, 1, 14]), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minCost([2, 2, 2, 2, 2], [4, 2, 8, 1, 3]), 0)
    }

}

private class Solution {
    func minCost(_ nums: [Int], _ cost: [Int]) -> Int {
        let numsAndCost: [(num: Int, cost: Int)] = nums.indices.map { (nums[$0], cost[$0]) }.sorted {
            $0.num < $1.num
        }
        
        var prefixCost = Array(repeating: 0, count: nums.count)
        prefixCost[0] = numsAndCost[0].cost
        for i in numsAndCost.indices where i > 0 {
            prefixCost[i] = numsAndCost[i].cost + prefixCost[i - 1]
        }
        
        var totalCost = 0
        for pair in numsAndCost {
            totalCost += pair.cost * (pair.num - numsAndCost[0].num)
        }
        
        var answer = totalCost
        
        for i in numsAndCost.indices where i > 0 {
            let gap = numsAndCost[i].num - numsAndCost[i - 1].num
            totalCost += (2 * prefixCost[i - 1] - prefixCost[nums.count - 1]) * gap
            answer = min(answer, totalCost)
        }
        
        return answer
    }
}
