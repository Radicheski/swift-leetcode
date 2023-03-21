//
//  NumberOfZeroFilledSubarrays.swift
//  https://leetcode.com/problems/number-of-zero-filled-subarrays/
//
//  Created by Erik Radicheski da Silva on 21/03/23.
//

import XCTest

final class NumberOfZeroFilledSubarrays: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.zeroFilledSubarray([1, 3, 0, 0, 2, 0, 0, 4]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.zeroFilledSubarray([0, 0, 0, 2, 0, 0]), 9)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.zeroFilledSubarray([2, 10, 2019]), 0)
    }

}

private class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var result = 0
        
        var counter = 0
        
        for num in nums {
            guard num == 0 else {
                counter = 0
                continue
            }
            
            counter += 1
            result += counter
        }
        
        return result
    }
}
