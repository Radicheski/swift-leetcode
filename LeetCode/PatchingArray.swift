//
//  PatchingArray.swift
//  https://leetcode.com/problems/patching-array/
//
//  Created by Erik Radicheski da Silva on 16/06/24.
//

import XCTest

final class PatchingArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minPatches([1, 3], 6), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minPatches([1, 5, 10], 20), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minPatches([1, 2, 2], 5), 0)
    }
    
}

private class Solution {
    func minPatches(_ nums: [Int], _ n: Int) -> Int {
        var count = 0
        var missing = 1
        var index = 0
        
        while missing <= n {
            if nums.indices.contains(index) && nums[index] <= missing {
                missing += nums[index]
                index += 1
            } else {
                missing *= 2
                count += 1
            }
        }
        
        return count
    }
}
