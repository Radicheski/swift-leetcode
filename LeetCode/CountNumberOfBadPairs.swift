//
//  CountNumberOfBadPairs.swift
//  https://leetcode.com/problems/count-number-of-bad-pairs/
//
//  Created by Erik Radicheski da Silva on 09/02/25.
//

import XCTest

final class CountNumberOfBadPairs: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countBadPairs([4, 1, 3, 3]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countBadPairs([1, 2, 3, 4, 5]), 0)
    }
    
}

private class Solution {
    func countBadPairs(_ nums: [Int]) -> Int {
        var pairs = [Int: Int]()
        var count = 0
        
        for (i, num) in nums.enumerated() {
            count += i - pairs[num - i, default: 0]
            
            pairs[num - i, default: 0] += 1
        }
        
        return count
    }
}
