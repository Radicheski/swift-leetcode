//
//  LargestCombinationWithBitwiseANDGreaterThanZero.swift
//  https://leetcode.com/problems/largest-combination-with-bitwise-and-greater-than-zero/
//
//  Created by Erik Radicheski da Silva on 07/11/24.
//

import XCTest

final class LargestCombinationWithBitwiseANDGreaterThanZero: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestCombination([16, 17, 71, 62, 12, 24, 14]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestCombination([8, 8]), 2)
    }
    
}

private class Solution {
    func largestCombination(_ candidates: [Int]) -> Int {
        var bits = Array(repeating: 0, count: Int.bitWidth)
        
        for num in candidates {
            for i in bits.indices where num & (1 << i) > 0 {
                bits[i] += 1
            }
        }
        
        return bits.max()!
    }
}
