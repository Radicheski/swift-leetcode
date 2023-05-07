//
//  FindTheLongestValidObstacleCourseAtEachPosition.swift
//  https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position/
//
//  Created by Erik Radicheski da Silva on 07/05/23.
//

import XCTest

final class FindTheLongestValidObstacleCourseAtEachPosition: XCTestCase {

   private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestObstacleCourseAtEachPosition([1, 2, 3, 2]), [1, 2, 3, 3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestObstacleCourseAtEachPosition([2, 2, 1]), [1, 2, 1])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.longestObstacleCourseAtEachPosition([3, 1, 5, 6, 4, 2]), [1, 1, 2, 3, 2, 2])
    }

}

private class Solution {
    func longestObstacleCourseAtEachPosition(_ obstacles: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: obstacles.count)
        
        var lis = Array(repeating: 0, count: obstacles.count)
        var lisLength = 0
        
        for (i, height) in obstacles.enumerated() {
            let index = bisectRight(lis, height, lisLength)
            
            if index == lisLength {
                lisLength += 1
            }
            
            lis[index] = height
            result[i] = index + 1
        }
        
        return result
    }
    
    private func bisectRight(_ array: [Int], _ target: Int, _ right: Int) -> Int {
        guard right > 0 else { return 0 }
        
        var right = right
        var left = 0
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if array[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return left
    }
}
