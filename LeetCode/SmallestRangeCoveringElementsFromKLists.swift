//
//  SmallestRangeCoveringElementsFromKLists.swift
//  https://leetcode.com/problems/smallest-range-covering-elements-from-k-lists/
//
//  Created by Erik Radicheski da Silva on 13/10/24.
//

import XCTest

final class SmallestRangeCoveringElementsFromKLists: XCTestCase {
    
    private let solution = Solution()
    
    func testExmapleA() {
        XCTAssertEqual(solution.smallestRange([[4, 10, 15, 24, 26], [0, 9, 12, 20], [5, 18, 22, 30]]), [20, 24])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.smallestRange([[1, 2, 3], [1, 2, 3], [1, 2, 3]]), [1, 1])
    }
    
}

private class Solution {
    func smallestRange(_ nums: [[Int]]) -> [Int] {
        var indices = nums.map { _ in 0 }
        
        var range = 0 ... .max
        
        while true {
            var currentMin = Int.max
            var currentMax = Int.min
            var minimumListIndex = 0
            
            for (i, list) in nums.enumerated() {
                let currentElement = list[indices[i]]
                
                if currentElement < currentMin {
                    currentMin = currentElement
                    minimumListIndex = i
                }
                
                currentMax = max(currentMax, currentElement)
            }
            
            if currentMax - currentMin < range.upperBound - range.lowerBound {
                range = currentMin ... currentMax
            }
            
            indices[minimumListIndex] += 1
            
            if indices[minimumListIndex] == nums[minimumListIndex].count { break }
        }
        
        return [range.lowerBound, range.upperBound]
    }
}
