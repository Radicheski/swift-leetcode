//
//  FindPeakElement.swift
//  https://leetcode.com/problems/find-peak-element/
//
//  Created by Erik Radicheski da Silva on 20/10/22.
//

import XCTest

final class FindPeakElement: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let expectedSolution = Set([2])
        XCTAssertTrue(expectedSolution.contains(solution.findPeakElement([1, 2, 3, 1])))
    }
    
    func testExampleB() {
        let expectedSolution = Set([1, 5])
        XCTAssertTrue(expectedSolution.contains(solution.findPeakElement([1, 2, 1, 3, 5, 6, 4])))
    }
    
}

private class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        var start = nums.startIndex
        var end = nums.endIndex - 1
        
        while start < end {
            let middle = (start + end) / 2
            
            if nums[middle] < nums[middle + 1] {
                start = middle + 1
            } else {
                end = middle
            }
        }
        
        return start
    }
}
