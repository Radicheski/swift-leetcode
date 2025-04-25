//
//  CountOfInterestingSubarrays.swift
//  https://leetcode.com/problems/count-of-interesting-subarrays/
//
//  Created by Erik Radicheski da Silva on 25/04/25.
//

import XCTest

final class CountOfInterestingSubarrays: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countInterestingSubarrays([3, 2, 4], 2, 1), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countInterestingSubarrays([3, 1, 9, 6], 3, 0), 2)
    }
    
}

private class Solution {
    func countInterestingSubarrays(_ nums: [Int], _ modulo: Int, _ k: Int) -> Int {
        var count = [0: 1]
        var result = 0
        var prefix = 0
        
        for num in nums {
            prefix += num % modulo == k ? 1 : 0
            result += count[(prefix - k + modulo) % modulo, default: 0]
            count[prefix % modulo, default: 0] += 1
        }
        
        return result
    }
}
