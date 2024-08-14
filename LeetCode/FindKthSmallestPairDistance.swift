//
//  FindKthSmallestPairDistance.swift
//  https://leetcode.com/problems/find-k-th-smallest-pair-distance/
//
//  Created by Erik Radicheski da Silva on 14/08/24.
//

import XCTest

final class FindKthSmallestPairDistance: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.smallestDistancePair([1, 3, 1], 1), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.smallestDistancePair([1, 1, 1], 2), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.smallestDistancePair([1, 6, 1], 3), 5)
    }
    
}

private class Solution {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        let arraySize = nums.count
        
        var low = 0
        var high = nums[arraySize - 1] - nums[0]
        
        while low < high {
            let middle = low + (high - low) / 2
            
            var count = 0
            
            var left = 0
            for right in nums.indices {
                while nums[right] - nums[left] > middle {
                    left += 1
                }
                count += right - left
            }
            
            if count < k {
                low = middle + 1
            } else {
                high = middle
            }
        }
        
        return low
    }
}
