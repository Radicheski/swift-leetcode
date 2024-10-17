//
//  MaximumSwap.swift
//  https://leetcode.com/problems/maximum-swap/
//
//  Created by Erik Radicheski da Silva on 17/10/24.
//

import XCTest

final class MaximumSwap: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumSwap(2736), 7236)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumSwap(9973), 9973)
    }
    
}

private class Solution {
    func maximumSwap(_ num: Int) -> Int {
        var digits = [Int]()
        var num = num
        
        while num > 0 {
            digits.append(num % 10)
            num /= 10
        }
        
        digits.reverse()
        let n = digits.count
        
        var maxRightIndex = Array(repeating: -1, count: n)
        maxRightIndex[n - 1] = n - 1
        
        for i in stride(from: n - 2, through: 0, by: -1) {
            if digits[i] > digits[maxRightIndex[i + 1]] {
                maxRightIndex[i] = i
            } else {
                maxRightIndex[i] = maxRightIndex[i + 1]
            }
        }
        
        for i in digits.indices {
            if digits[i] < digits[maxRightIndex[i]] {
                digits[i] ^= digits[maxRightIndex[i]]
                digits[maxRightIndex[i]] ^= digits[i]
                digits[i] ^= digits[maxRightIndex[i]]
                
                break
            }
        }
        
        return digits.reduce(into: 0) { $0 = $0 * 10 + $1 }
    }
}
