//
//  MinimumNumberOfRemovalsToMakeMountainArray.swift
//  https://leetcode.com/problems/minimum-number-of-removals-to-make-mountain-array/
//
//  Created by Erik Radicheski da Silva on 30/10/24.
//

import XCTest

final class MinimumNumberOfRemovalsToMakeMountainArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumMountainRemovals([1, 3, 1]), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumMountainRemovals([2, 1, 1, 5, 6, 2, 3, 1]), 3)
    }
    
}

private class Solution {
    func minimumMountainRemovals(_ nums: [Int]) -> Int {
        var lis = Array(repeating: 1, count: nums.count)
        var lds = Array(repeating: 1, count: nums.count)
        var answer = Int.max
        
        for i in nums.indices {
            for j in nums.indices.reversed() where j < i {
                guard nums[j] < nums[i] else { continue }
                
                lis[i] = max(lis[i], lis[j] + 1)
            }
        }
        
        for i in nums.indices.reversed() {
            for j in nums.indices where j > i {
                guard nums[j] < nums[i] else { continue }
                
                lds[i] = max(lds[i], lds[j] + 1)
            }
        }
        
        for i in nums.indices {
            guard lis[i] > 1 else { continue }
            guard lds[i] > 1 else { continue }
            
            answer = min(answer, nums.count - lis[i] - lds[i] + 1)
        }
        
        return answer
    }
}
