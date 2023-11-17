//
//  MinimizeMaximumPairSumInArray.swift
//  https://leetcode.com/problems/minimize-maximum-pair-sum-in-array/
//
//  Created by Erik Radicheski da Silva on 17/11/23.
//

import XCTest

final class MinimizeMaximumPairSumInArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minPairSum([3, 5, 2, 3]), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minPairSum([3, 5, 4, 2, 4, 6]), 8)
    }

}

private class Solution {
    func minPairSum(_ nums: [Int]) -> Int {
        let n = nums.count
        let nums = nums.sorted()
        var answer = Int.min
        
        for i in nums.indices {
            let j = n - i - 1
            guard i < j else { break }
            
            answer = max(answer, nums[i] + nums[j])
        }
        
        return answer
    }
}
