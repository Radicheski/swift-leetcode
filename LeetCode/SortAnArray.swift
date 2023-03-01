//
//  SortAnArray.swift
//  https://leetcode.com/problems/sort-an-array/
//
//  Created by Erik Radicheski da Silva on 01/03/23.
//

import XCTest

final class SortAnArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sortArray([5, 2, 3, 1]), [1, 2, 3, 5])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sortArray([5, 1, 1, 2, 0, 0]), [0, 0, 1, 1, 2, 5])
    }
    
}

private class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        
        let middle = nums.count / 2
        
        var first = sortArray(Array(nums[..<middle]))
        var last = sortArray(Array(nums[middle...]))
        
        var result = [Int]()
        
        while first.isEmpty == false && last.isEmpty == false {
            if first[0] < last[0] {
                result.append(first.removeFirst())
            } else if first[0] > last[0] {
                result.append(last.removeFirst())
            } else {
                result.append(first.removeFirst())
                result.append(last.removeFirst())
            }
        }
        
        result.append(contentsOf: first)
        result.append(contentsOf: last)
        
        return result
    }
}
