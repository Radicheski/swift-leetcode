//
//  TwoSum.swift
//  https://leetcode.com/problems/two-sum/
//
//  Created by Erik Radicheski da Silva on 28/08/22.
//

import XCTest

class TwoSum: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.twoSum([2, 7, 11, 15], 9), [0, 1])
        XCTAssertEqual(solution.twoSum([3, 2, 4], 6), [1, 2])
        XCTAssertEqual(solution.twoSum([3, 3], 6), [0, 1])
    }

}

private class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for firstIndex in 0 ..< nums.count {
            for secondIndex in firstIndex + 1 ..< nums.count {
                if nums[firstIndex] + nums[secondIndex] == target {
                    return [firstIndex, secondIndex]
                }
            }
        }
        
        return []
    }
}
