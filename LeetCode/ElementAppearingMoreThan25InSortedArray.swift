//
//  ElementAppearingMoreThan25InSortedArray.swift
//  https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array/
//
//  Created by Erik Radicheski da Silva on 11/12/23.
//

import XCTest

final class ElementAppearingMoreThan25InSortedArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findSpecialInteger([1, 2, 2, 6, 6, 6, 6, 7, 10]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findSpecialInteger([1, 1]), 1)
    }

}

private class Solution {
    func findSpecialInteger(_ arr: [Int]) -> Int {
        let threshold = 0.25 * Double(arr.count)
        
        var count = 0.0
        var lastNum: Int?
        
        for num in arr {
            if num == lastNum {
                count += 1
            } else {
                lastNum = num
                count = 1
            }
            
            guard count <= threshold else { return num }
        }
        
        return .min
    }
}
