//
//  ShortestSubarrayToBeRemovedToMakeArraySorted.swift
//  https://leetcode.com/problems/shortest-subarray-to-be-removed-to-make-array-sorted/
//
//  Created by Erik Radicheski da Silva on 15/11/24.
//

import XCTest

final class ShortestSubarrayToBeRemovedToMakeArraySorted: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findLengthOfShortestSubarray([1, 2, 3, 10, 4, 2, 3, 5]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findLengthOfShortestSubarray([5, 4, 3, 2, 1]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findLengthOfShortestSubarray([1, 2, 3]), 0)
    }
    
}

private class Solution {
    func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
        var right = arr.endIndex - 1
        
        while 0 < right && arr[right - 1] <= arr[right] {
            right -= 1
        }
        
        var answer = right
        var left = 0
        
        while left < right && (left == 0 || arr[left - 1] <= arr[left]) {
            while right < arr.endIndex && arr[right] < arr[left] {
                right += 1
            }
            
            answer = min(answer, right - left - 1)
            left += 1
        }
        
        return answer
    }
}
