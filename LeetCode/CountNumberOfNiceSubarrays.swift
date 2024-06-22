//
//  CountNumberOfNiceSubarrays.swift
//  https://leetcode.com/problems/count-number-of-nice-subarrays/
//
//  Created by Erik Radicheski da Silva on 22/06/24.
//

import XCTest

final class CountNumberOfNiceSubarrays: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfSubarrays([1, 1, 2, 1, 1], 3), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfSubarrays([2, 4, 6], 1), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numberOfSubarrays([2, 2, 2, 1, 2, 2, 1, 2, 2, 2], 2), 16)
    }
    
}

private class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var answer = 0
        var prefixSum = [0: 1]
        
        for num in nums {
            sum += num % 2
            
            if let count = prefixSum[sum - k] {
                answer += count
            }
            
            prefixSum[sum, default: 0] += 1
        }
        
        return answer
    }
}
