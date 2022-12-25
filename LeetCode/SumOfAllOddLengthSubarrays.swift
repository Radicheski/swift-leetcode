//
//  SumOfAllOddLengthSubarrays.swift
//  https://leetcode.com/problems/sum-of-all-odd-length-subarrays/
//
//  Created by Erik Radicheski da Silva on 25/12/22.
//

import XCTest

final class SumOfAllOddLengthSubarrays: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sumOddLengthSubarrays([1, 4, 2, 5, 3]), 58)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sumOddLengthSubarrays([1, 2]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.sumOddLengthSubarrays([10, 11, 12]), 66)
    }

}

private class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var preffix = [0]
        for i in 0 ..< arr.endIndex {
            preffix.append(arr[i] + preffix[i])
        }
        
        var sum = 0
        
        for i in stride(from: 1, through: arr.count, by: 2) {
            for j in 0 ... arr.endIndex - i {
                sum += preffix[j + i]
                sum -= preffix[j]
            }
        }
        
        return sum
    }
}
