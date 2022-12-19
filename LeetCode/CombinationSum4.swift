//
//  CombinationSum4.swift
//  https://leetcode.com/problems/combination-sum-iv/
//
//  Created by Erik Radicheski da Silva on 19/12/22.
//

import XCTest

final class CombinationSum4: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.combinationSum4([1, 2, 3], 4), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.combinationSum4([9], 3), 0)
    }

}

private class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var dict = [Int: Int]()
        dict[0] = 1
        return combinationSum(nums, target, &dict)
    }
    
    private func combinationSum(_ nums: [Int], _ target: Int, _ dict: inout [Int: Int]) -> Int {
        guard target >= 0 else { return 0 }
        guard dict[target] == nil else { return dict[target]! }
        
        var result = 0
        for num in nums {
            result += combinationSum(nums, target - num, &dict)
        }
        
        dict[target] = result
        return result
    }
}
