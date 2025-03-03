//
//  PartitionArrayAccordingToGivenPivot.swift
//  https://leetcode.com/problems/partition-array-according-to-given-pivot/
//
//  Created by Erik Radicheski da Silva on 03/03/25.
//

import XCTest

final class PartitionArrayAccordingToGivenPivot: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.pivotArray([9, 12, 5, 10, 14, 3, 10], 10), [9, 5, 3, 10, 10, 12, 14])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.pivotArray([-3, 4, 3, 2], 2), [-3, 2, 4, 3])
    }
    
}

private class Solution {
    func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
        var lesser = [Int]()
        var pivotCount = 0
        var greater = [Int]()
        
        for num in nums {
            if num == pivot {
                pivotCount += 1
            } else if num < pivot {
                lesser.append(num)
            } else if num > pivot {
                greater.append(num)
            }
        }
        
        return lesser + Array(repeating: pivot, count: pivotCount) + greater
    }
}
