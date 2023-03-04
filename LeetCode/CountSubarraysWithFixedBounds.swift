//
//  CountSubarraysWithFixedBounds.swift
//  https://leetcode.com/problems/count-subarrays-with-fixed-bounds/
//
//  Created by Erik Radicheski da Silva on 04/03/23.
//

import XCTest

final class CountSubarraysWithFixedBounds: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countSubarrays([1, 3, 5, 2, 7, 5], 1, 5), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countSubarrays([1, 1, 1, 1], 1, 1), 10)
    }

}

private class Solution {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        guard minK <= maxK else { return 0 }
        
        var count = 0
        
        var minPosition = -1
        var maxPosition = -1
        var leftBound = -1
        
        for i in nums.indices {
            if (minK ... maxK).contains(nums[i]) == false {
                leftBound = i
            }
            
            if nums[i] == minK {
                minPosition = i
            }
            if nums[i] == maxK {
                maxPosition = i
            }
            
            count += max(0, min(maxPosition, minPosition) - leftBound)
        }
        
        return count
    }
}
