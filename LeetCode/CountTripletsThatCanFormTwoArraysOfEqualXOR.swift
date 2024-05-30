//
//  CountTripletsThatCanFormTwoArraysOfEqualXOR.swift
//  https://leetcode.com/problems/count-triplets-that-can-form-two-arrays-of-equal-xor/
//
//  Created by Erik Radicheski da Silva on 30/05/24.
//

import XCTest

final class CountTripletsThatCanFormTwoArraysOfEqualXOR: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countTriplets([2, 3, 1, 6, 7]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countTriplets([1, 1, 1, 1, 1]), 10)
    }
    
}

private class Solution {
    func countTriplets(_ arr: [Int]) -> Int {
        guard arr.count > 0 else { return 0 }

        var prefixXor = [0] + arr
        for i in 1 ..< prefixXor.endIndex {
            prefixXor[i] ^= prefixXor[i - 1]
        }
        
        var count = 0
        
        for i in 0 ..< prefixXor.endIndex {
            for j in i + 1 ..< prefixXor.endIndex where prefixXor[i] == prefixXor[j] {
                count += j - i - 1
            }
        }
        
        return count
    }
}
