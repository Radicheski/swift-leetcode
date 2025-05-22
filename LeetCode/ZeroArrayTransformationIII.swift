//
//  ZeroArrayTransformationIII.swift
//  https://leetcode.com/problems/zero-array-transformation-iii/
//
//  Created by Erik Radicheski da Silva on 22/05/25.
//

import XCTest

final class ZeroArrayTransformationIII: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxRemoval([2, 0, 2], [[0, 2], [0, 2], [1, 1]]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxRemoval([1, 1, 1, 1], [[1, 3], [0, 2], [1, 3], [1, 2]]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxRemoval([1, 2, 3, 4], [[0, 3]]), -1)
    }
    
}

private class Solution {
    func maxRemoval(_ nums: [Int], _ queries: [[Int]]) -> Int {
        let sortedQueries = queries.sorted { $0[0] < $1[0] }
        var heap = Heap<Int>(sort: >) // Max-heap
        var deltaArray = Array(repeating: 0, count: nums.count + 1)
        var operations = 0
        var j = 0

        for i in 0..<nums.count {
            operations += deltaArray[i]
            while j < sortedQueries.count && sortedQueries[j][0] == i {
                heap.insert(sortedQueries[j][1])
                j += 1
            }
            while operations < nums[i], let top = heap.peek(), top >= i {
                operations += 1
                deltaArray[top + 1] -= 1
                heap.remove()
            }
            if operations < nums[i] {
                return -1
            }
        }

        return heap.count
    }
}
