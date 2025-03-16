//
//  HouseRobberIV.swift
//  https://leetcode.com/problems/house-robber-iv/
//
//  Created by Erik Radicheski da Silva on 16/03/25.
//

import XCTest

final class HouseRobberIV: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minCapability([2, 3, 5, 9], 2), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minCapability([2, 7, 9, 3, 1], 2), 2)
    }
    
}

private class Solution {
    func minCapability(_ nums: [Int], _ k: Int) -> Int {
        var left = 1
        var right = nums.max()!
        
        while left < right {
            let middle = left + (right - left) / 2
            
            var possibleThefts = 0
            var i = 0
            
            while i < nums.endIndex {
                if nums[i] <= middle {
                    possibleThefts += 1
                    i += 1
                }

                i += 1
            }
            
            if possibleThefts >= k {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
}
