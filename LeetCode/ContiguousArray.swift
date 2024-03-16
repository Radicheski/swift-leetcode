//
//  ContiguousArray.swift
//  https://leetcode.com/problems/contiguous-array/description/?envType=daily-question&envId=2024-03-16
//
//  Created by Erik Radicheski da Silva on 16/03/24.
//

import XCTest

final class ContiguousArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMaxLength([0, 1]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMaxLength([0, 1, 0]), 2)
    }
    
}

private class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var count = 0
        var length = 0
        var indices = [0: -1]
        
        for (i, num) in nums.enumerated() {
            count += 2 * num - 1
            
            if let index = indices[count] {
                length = max(length, i - index)
            } else {
                indices[count] = i
            }
        }
        
        return length
    }
}
