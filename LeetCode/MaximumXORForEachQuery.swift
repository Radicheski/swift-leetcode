//
//  MaximumXORForEachQuery.swift
//  https://leetcode.com/problems/maximum-xor-for-each-query/
//
//  Created by Erik Radicheski da Silva on 08/11/24.
//

import XCTest

final class MaximumXORForEachQuery: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getMaximumXor([0, 1, 1, 3], 2), [0, 3, 2, 3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getMaximumXor([2, 3, 4, 7], 3), [5, 2, 6, 5])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.getMaximumXor([0, 1, 2, 2, 5, 7], 3), [4, 3, 6, 4, 6, 7])
    }
    
}

private class Solution {
    func getMaximumXor(_ nums: [Int], _ maximumBit: Int) -> [Int] {
        let target = 1 << maximumBit - 1
        
        var xor = 0
        var answer = [Int]()
        
        for num in nums {
            xor ^= num
            answer.append(xor)
        }
        
        answer.reverse()
        
        return answer.map { $0 ^ target }
    }
}
