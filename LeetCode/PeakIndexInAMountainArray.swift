//
//  PeakIndexInAMountainArray.swift
//  https://leetcode.com/problems/peak-index-in-a-mountain-array/
//
//  Created by Erik Radicheski da Silva on 25/07/23.
//

import XCTest

final class PeakIndexInAMountainArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.peakIndexInMountainArray([0, 1, 0]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.peakIndexInMountainArray([0, 2, 1, 0]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.peakIndexInMountainArray([0, 10, 5, 2]), 1)
    }

}

private class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var left = 0
        var right = arr.endIndex - 1
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if arr[middle] > arr[middle + 1] && arr[middle] > arr[middle - 1] {
                return middle
            } else if arr[middle] > arr[middle + 1] {
                right = middle
            } else {
                left = middle
            }
        }
        
        return left
    }
}
