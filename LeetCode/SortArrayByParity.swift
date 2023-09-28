//
//  SortArrayByParity.swift
//  https://leetcode.com/problems/sort-array-by-parity/
//
//  Created by Erik Radicheski da Silva on 28/09/23.
//

import XCTest

final class SortArrayByParity: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sortArrayByParity([3, 1, 2, 4]), [2, 4, 3, 1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sortArrayByParity([0]), [0])
    }

}

private class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var sortedArray = nums
        
        var insertIndex = 0
        
        for (i, num) in sortedArray.enumerated() where num.isMultiple(of: 2) {
            let _ = sortedArray.remove(at: i)
            sortedArray.insert(num, at: insertIndex)
            insertIndex += 1
        }
        
        
        return sortedArray
    }
}
