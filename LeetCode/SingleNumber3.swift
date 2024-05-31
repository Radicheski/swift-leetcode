//
//  SingleNumber3.swift
//  https://leetcode.com/problems/single-number-iii/
//
//  Created by Erik Radicheski da Silva on 31/05/24.
//

import XCTest

final class SingleNumber3: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.singleNumber([1, 2, 1, 3, 2, 5]), [3, 5])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.singleNumber([-1, 0]), [-1, 0])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.singleNumber([0, 1]), [1, 0])
    }
    
}

private class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        let xor = nums.reduce(into: 0, ^=)
        
        let common = 1 << xor.trailingZeroBitCount
        
        var answer = [0, 0]
        
        for num in nums {
            if num & common == 0 {
                answer[0] ^= num
            } else {
                answer[1] ^= num
            }
        }
        
        return answer
    }
}
