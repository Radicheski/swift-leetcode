//
//  MergeSortedArray.swift
//  https://leetcode.com/problems/merge-sorted-array/
//
//  Created by Erik Radicheski da Silva on 01/09/22.
//

import XCTest

class MergeSortedArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        var input1 = [1, 2, 3, 0, 0, 0]
        let input2 = [2, 5, 6]
        solution.merge(&input1, 3, input2, 3)
        XCTAssertEqual(input1, [1, 2, 2, 3, 5, 6])
    }
    
    func testExampleB() {
        var input1 = [1]
        let input2 = [Int]()
        solution.merge(&input1, 1, input2, 0)
        XCTAssertEqual(input1, [1])
    }
    
    func testExampleC() {
        var input1 = [0]
        let input2 = [1]
        solution.merge(&input1, 0, input2, 1)
        XCTAssertEqual(input1, [1])
    }

}

private class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var nextIndex = 0
        
        for (count, element) in nums2.enumerated() {
            for index in nextIndex ..< nums1.count {
                if (index >= m + count && nums1[index] == 0) || element < nums1[index] {
                    nums1.insert(element, at: index)
                    let _ = nums1.popLast()
                    nextIndex = index + 1
                    break
                }
            }
        }
    }
}
