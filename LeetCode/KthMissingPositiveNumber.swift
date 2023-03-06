//
//  KthMissingPositiveNumber.swift
//  https://leetcode.com/problems/kth-missing-positive-number/
//
//  Created by Erik Radicheski da Silva on 06/03/23.
//

import XCTest

final class KthMissingPositiveNumber: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findKthPositive([2, 3, 4, 7, 11], 5), 9)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findKthPositive([1, 2, 3, 4], 2), 6)
    }

}

private class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var k = k
        var index = 0
        var number = 0
        
        while k > 0 {
            number += 1
            
            if arr.indices.contains(index) && arr[index] == number {
                index += 1
            } else {
                k -= 1
            }
        }
        
        return number
    }
}
