//
//  MaximumNumberOfIntegersToChooseFromARange1.swift
//  https://leetcode.com/problems/maximum-number-of-integers-to-choose-from-a-range-i/
//
//  Created by Erik Radicheski da Silva on 06/12/24.
//

import XCTest

final class MaximumNumberOfIntegersToChooseFromARange1: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxCount([1, 6, 5], 5, 6), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxCount([1, 2, 3, 4, 5, 6, 7], 8, 1), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxCount([11], 7, 50), 7)
    }
    
}

private class Solution {
    func maxCount(_ banned: [Int], _ n: Int, _ maxSum: Int) -> Int {
        let set = Set(1 ... n).subtracting(banned).sorted()
        var dp = Array(repeating: [Int: Int](), count: set.count)
        return count(0, maxSum, set, &dp)
    }
    
    private func count(_ i: Int, _ sum: Int, _ set: [Int], _ dp: inout [[Int: Int]]) -> Int {
        guard set.indices.contains(i) else { return 0 }
        guard set[i] <= sum else { return 0 }
        
        if let answer = dp[i][sum] {
            return answer
        }
        
        let answer = count(i + 1, sum - set[i], set, &dp) + 1
        dp[i][sum] = answer
        
        return answer
    }
}
