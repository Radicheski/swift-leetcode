//
//  SumOfAllSubsetXORTotals.swift
//  https://leetcode.com/problems/sum-of-all-subset-xor-totals/
//
//  Created by Erik Radicheski da Silva on 20/05/24.
//

import XCTest

final class SumOfAllSubsetXORTotals: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.subsetXORSum([1, 3]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.subsetXORSum([5, 1, 6]), 28)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.subsetXORSum([3, 4, 5, 6, 7, 8]), 480)
    }
    
}

private class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        var sum = 0
        
        for i in 0 ..< 1 << nums.count {
            var xor = 0
            
            for (j, num) in String(i, radix: 2).reversed().enumerated() where num == "1" {
                xor ^= nums[j]
            }
            
            sum += xor
        }
        
        return sum
    }
}
