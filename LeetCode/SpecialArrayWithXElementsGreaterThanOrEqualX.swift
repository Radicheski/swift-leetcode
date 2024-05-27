//
//  SpecialArrayWithXElementsGreaterThanOrEqualX.swift
//  testLeetcode
//
//  Created by Erik Radicheski da Silva on 27/05/24.
//

import XCTest

final class SpecialArrayWithXElementsGreaterThanOrEqualX: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.specialArray([3, 5]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.specialArray([0, 0]), -1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.specialArray([0, 4, 3, 0, 4]), 3)
    }
    
}

private class Solution {
    func specialArray(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        
        for i in 1 ... nums.count {
            var start = 0
            var end = nums.endIndex - 1
            
            var j = nums.count
            
            while start <= end {
                let middle = start + (end - start) / 2
                
                if nums[middle] >= i {
                    j = middle
                    end = middle - 1
                } else {
                    start = middle + 1
                }
            }
            
            if nums.count - j == i { return i }
        }
        
        return -1
    }
}
