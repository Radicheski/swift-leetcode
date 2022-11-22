//
//  ThreeSumClosest.swift
//  https://leetcode.com/problems/3sum-closest/
//
//  Created by Erik Radicheski da Silva on 22/11/22.
//

import XCTest

final class ThreeSumClosest: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.threeSumClosest([-1, 2, 1, -4], 1), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.threeSumClosest([0, 0, 0], 1), 0)
    }
    
}

private class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        
        var result = Int.max
        var distance = Int.max
        
        for index in 0 ..< nums.endIndex - 2 {
            for right in index + 2 ..< nums.endIndex {
                var left = index + 1
                
                while left < right {
                    let sum = [nums[index], nums[left], nums[right]].reduce(into: 0, +=)
                    
                    if abs(sum - target) < distance {
                        distance = abs(sum - target)
                        result = sum
                    }
                    
                    left += 1
                }
            }
        }
        
        return result
    }
}
