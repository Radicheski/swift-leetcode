//
//  NumberOfSubArraysWithOddSum.swift
//  https://leetcode.com/problems/number-of-sub-arrays-with-odd-sum/
//
//  Created by Erik Radicheski da Silva on 25/02/25.
//

import XCTest

final class NumberOfSubArraysWithOddSum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numOfSubarrays([1, 3, 5]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numOfSubarrays([2, 4, 6]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numOfSubarrays([1, 2, 3, 4, 5, 6, 7]), 16)
    }
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func numOfSubarrays(_ arr: [Int]) -> Int {
        let n = arr.count
        let isEven = arr.map { $0 % 2 == 0 }
        
        var even = Array(repeating: 0, count: n)
        var odd = Array(repeating: 0, count: n)
        
        if isEven[n - 1] {
            even[n - 1] = 1
        } else {
            odd[n - 1] = 1
        }
        
        for i in (0 ..< n-1).reversed() {
            if isEven[i] {
                even[i] = (1 + even[i + 1]) % mod
                odd[i] = odd[i + 1]
            } else {
                even[i] = odd[i + 1]
                odd[i] = (1 + even[i + 1]) % mod
            }
        }
        
        var totalCount = 0
        
        for count in odd {
            totalCount += count
            totalCount %= mod
        }
        
        return totalCount
    }
}
