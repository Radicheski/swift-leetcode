//
//  FindTheDuplicateNumber.swift
//  https://leetcode.com/problems/find-the-duplicate-number/
//
//  Created by Erik Radicheski da Silva on 18/09/23.
//

import XCTest

final class FindTheDuplicateNumber: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findDuplicate([1, 3, 4, 2, 2]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findDuplicate([3, 1, 3, 4, 2]), 3)
    }
}

private class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var answer = 0
        
        for b in 0 ... .bitWidth {
            var baseBitCount = 0
            var bitCount = 0
            
            for i in nums.indices {
                if nums[i] & (1 << b) > 0 {
                    bitCount += 1
                }
                
                guard i > 0 else { continue }
                
                if i & (1 << b) > 0 {
                    baseBitCount += 1
                }
            }
            
            if baseBitCount < bitCount {
                answer |= 1 << b
            }
        }
       
        return answer
    }
}
