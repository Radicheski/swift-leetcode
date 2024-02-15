//
//  FindPolygonWithTheLargestPerimeter.swift
//  https://leetcode.com/problems/find-polygon-with-the-largest-perimeter/
//
//  Created by Erik Radicheski da Silva on 15/02/24.
//

import XCTest

final class FindPolygonWithTheLargestPerimeter: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestPerimeter([5, 5, 5]), 15)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestPerimeter([1, 12, 1, 2, 5, 50, 3]), 12)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.largestPerimeter([5, 5, 50]), -1)
    }
    
}

private class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var length = -1
        
        var sum = nums[0] + nums[1]
        
        for num in nums.suffix(from: 2) {
            if num < sum {
                length = sum + num
            }
            
            sum += num
        }
        
        return length
    }
}
