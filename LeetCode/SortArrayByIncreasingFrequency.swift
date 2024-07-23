//
//  SortArrayByIncreasingFrequency.swift
//  https://leetcode.com/problems/sort-array-by-increasing-frequency/
//
//  Created by Erik Radicheski da Silva on 23/07/24.
//

import XCTest

final class SortArrayByIncreasingFrequency: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.frequencySort([1, 1, 2, 2, 2, 3]), [3, 1, 1, 2, 2, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.frequencySort([2, 3, 1, 3, 2]), [1, 3, 3, 2, 2])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.frequencySort([-1, 1, -6, 4, 5, -6, 1, 4, 1]), [5, -1, 4, 4, -6, -6, 1, 1, 1])
    }
    
}

private class Solution {
    func frequencySort(_ nums: [Int]) -> [Int] {
        var frequency = [Int: Int]()
        
        for num in nums {
            frequency[num, default: 0] += 1
        }
        
        return frequency.sorted(by: { $0.value == $1.value ? $0.key > $1.key : $0.value < $1.value })
            .flatMap { Array(repeating: $0.key, count: $0.value) }
    }
}
