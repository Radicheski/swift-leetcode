//
//  BinaryTreesWithFactors.swift
//  https://leetcode.com/problems/binary-trees-with-factors/
//
//  Created by Erik Radicheski da Silva on 26/10/23.
//

import XCTest

final class BinaryTreesWithFactors: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numFactoredBinaryTrees([2, 4]), 3)
    }

    func testExampleB() {
        XCTAssertEqual(solution.numFactoredBinaryTrees([2, 4, 5, 10]), 7)
    }
    
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        var answer = 0
        let arr = arr.sorted()
        var map = [Int: Int]()
        
        for num in arr {
            var count = 1
            
            for factor in arr where factor * factor <= num && num.isMultiple(of: factor) {
                if let waysA = map[factor], let waysB = map[num / factor] {
                    count += waysA * waysB * (factor == num / factor ? 1 : 2)
                    count %= mod
                }
            }
            
            map[num] = count
            answer += count
            answer %= mod
        }
        
        return answer
    }
}
