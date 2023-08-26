//
//  MaximumLengthOfPairChain.swift
//  https://leetcode.com/problems/maximum-length-of-pair-chain/
//
//  Created by Erik Radicheski da Silva on 26/08/23.
//

import XCTest

final class MaximumLengthOfPairChain: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findLongestChain([[1, 2], [2, 3], [3, 4]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findLongestChain([[1, 2], [7, 8], [4, 5]]), 3)
    }

}

private class Solution {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let pairs = pairs.sorted { $0[0] < $1[0] }
        
        var dp: [Int?] = Array(repeating: nil, count: pairs.count)
        dp[dp.endIndex - 1] = 1
        
        return findLongestChain(pairs, 0, &dp)
    }
    
    private func findLongestChain(_ pairs: [[Int]], _ start: Int, _ dp: inout [Int?]) -> Int {
        if let answer = dp[start] {
            return answer
        }
        
        var answer = 1
        
        for i in (start + 1) ..< pairs.endIndex {
            let length = findLongestChain(pairs, i, &dp)
            
            if pairs[start][1] < pairs[i][0] {
                answer = max(answer, length + 1)
            } else {
                answer = max(answer, length)
            }
        }
        
        dp[start] = answer
        return answer
    }
    
}
