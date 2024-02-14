//
//  RearrangeArrayElementsBySign.swift
//  https://leetcode.com/problems/rearrange-array-elements-by-sign/
//
//  Created by Erik Radicheski da Silva on 14/02/24.
//

import XCTest

final class RearrangeArrayElementsBySign: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.rearrangeArray([3, 1, -2, -5, 2, -4]), [3, -2, 1, -5, 2, -4])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.rearrangeArray([-1, 1]), [1, -1])
    }
    
}

private class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var answer = Array(repeating: 0, count: nums.count)
        
        var positiveIndex = 0
        var negativeIndex = 1
        
        for num in nums {
            if num > 0 {
                answer[positiveIndex] = num
                positiveIndex += 2
            } else {
                answer[negativeIndex] = num
                negativeIndex += 2
            }
        }
        
        return answer
    }
}
