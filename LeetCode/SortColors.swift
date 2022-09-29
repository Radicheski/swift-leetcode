//
//  SortColors.swift
//  https://leetcode.com/problems/sort-colors/
//
//  Created by Erik Radicheski da Silva on 29/09/22.
//

import XCTest

final class SortColors: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        var input = [2, 0, 2, 1, 1, 0]
        solution.sortColors(&input)
        XCTAssertEqual(input, [0, 0, 1, 1, 2, 2])
    }
    
    func testExampleB() {
        var input = [2, 0, 1]
        solution.sortColors(&input)
        XCTAssertEqual(input, [0, 1, 2])
    }

}

private class Solution {
    
    func sortColors(_ nums: inout [Int]) {
        nums = mergeSort(nums)
    }
    
    func mergeSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        
        let midIndex = nums.count / 2
        
        var left = mergeSort(Array(nums[0 ..< midIndex]))
        var right = mergeSort(Array(nums[midIndex ..< nums.endIndex]))
        
        var result = [Int]()
        
        while left.isEmpty == false && right.isEmpty == false {
            if left.first! < right.first! {
                let leftFirst = left.removeFirst()
                result.append(leftFirst)
            } else {
                let rightFirst = right.removeFirst()
                result.append(rightFirst)
            }
        }
        
        result.append(contentsOf: left)
        result.append(contentsOf: right)
        
        return result
    }
    
}
