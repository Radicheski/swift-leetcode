//
//  SubarraySumsDivisibleByK.swift
//  https://leetcode.com/problems/subarray-sums-divisible-by-k/
//
//  Created by Erik Radicheski da Silva on 19/01/23.
//

import XCTest

final class SubarraySumsDivisibleByK: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.subarraysDivByK([4, 5, 0, -2, -3, 1], 5), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.subarraysDivByK([5], 9), 0)
    }

}

private class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var prefixMod = 0
        var result = 0
        
        var modGroups = Array(repeating: 0, count: k)
        modGroups[0] = 1
        
        for num in nums {
            prefixMod = (prefixMod + num % k + k) % k
            result += modGroups[prefixMod]
            modGroups[prefixMod] += 1
        }
        
        return result
    }
}
