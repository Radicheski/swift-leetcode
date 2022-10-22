//
//  ContainerWithMostWater.swift
//  https://leetcode.com/problems/container-with-most-water/
//
//  Created by Erik Radicheski da Silva on 22/10/22.
//

import XCTest

final class ContainerWithMostWater: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]), 49)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxArea([1, 1]), 1)
    }
    
}

private class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var (start, end) = (0, height.endIndex - 1)
        var mostVolume = 0
        
        while start < end {
            let volume = (end - start) * min(height[start], height[end])
            if volume > mostVolume { mostVolume = volume }
            if height[start] < height[end] {
                start += 1
            } else {
                end -= 1
            }
        }
        
        return mostVolume
    }
}
