//
//  NextGreaterElement1.swift
//  https://leetcode.com/problems/next-greater-element-i/
//
//  Created by Erik Radicheski da Silva on 24/12/22.
//

import XCTest

final class NextGreaterElement1: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.nextGreaterElement([4, 1, 2], [1, 3, 4, 2]), [-1, 3, -1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.nextGreaterElement([2, 4], [1, 2, 3, 4]), [3, -1])
    }

}

private class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = [Int]()
        
        for number in nums1 {
            let index = nums2.firstIndex(of: number)!
            
            if let nextGreater = nums2[index...].first(where: { $0 > number } ) {
                result.append(nextGreater)
            } else {
                result.append(-1)
            }
        }
        
        return result
    }
}
