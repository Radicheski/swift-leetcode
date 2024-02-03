//
//  PartitionArrayForMaximumSum.swift
//  https://leetcode.com/problems/partition-array-for-maximum-sum/
//
//  Created by Erik Radicheski da Silva on 03/02/24.
//

import XCTest

final class PartitionArrayForMaximumSum: XCTestCase {
    
    private let solution = Solution()

    func testExampleA() {
        XCTAssertEqual(solution.maxSumAfterPartitioning([1,15,7,9,2,5,10], 3), 84)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxSumAfterPartitioning([1,4,1,5,7,3,6,1,9,9,3], 4), 83)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxSumAfterPartitioning([1], 1), 1)
    }

}

private class Solution {
    func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
        var dp: [Int?] = Array(repeating: nil, count: arr.count)
        return maxSum(arr, k, &dp, 0)
    }
    
    private func maxSum(_ arr: [Int], _ k: Int, _ dp: inout [Int?], _ start: Int) -> Int {
        guard arr.indices.contains(start) else { return 0 }
        
        if let answer = dp[start] {
            return answer
        }
        
        var currentMax = 0
        var answer = 0
        var end = min(arr.endIndex, start + k)
        
        for i in start ..< end {
            currentMax = max(currentMax, arr[i])
            answer = max(answer, currentMax * (i - start + 1) + maxSum(arr, k, &dp, i + 1))
        }
        
        dp[start] = answer
        return answer
    }
}
