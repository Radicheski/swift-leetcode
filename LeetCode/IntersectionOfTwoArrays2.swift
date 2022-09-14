//
//  IntersectionOfTwoArrays2.swift
//  https://leetcode.com/problems/intersection-of-two-arrays-ii/
//
//  Created by Erik Radicheski da Silva on 02/09/22.
//

import XCTest

class IntersectionOfTwoArrays2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.intersect([1, 2, 2, 1], [2, 2]), [2, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.intersect([4, 9, 5], [9, 4, 9, 8, 4]), [4, 9])
    }

}

private class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums2 = nums2
        var result = [Int]()
        
        for element in nums1 {
            if let index = nums2.firstIndex(of: element) {
                nums2.remove(at: index)
                result.append(element)
            }
        }
        
        return result
    }
}
