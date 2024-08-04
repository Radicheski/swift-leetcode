//
//  RangeSumOfSortedSubarraySums.swift
//  https://leetcode.com/problems/range-sum-of-sorted-subarray-sums/
//
//  Created by Erik Radicheski da Silva on 04/08/24.
//

import XCTest

final class RangeSumOfSortedSubarraySums: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.rangeSum([1, 2, 3, 4], 4, 1, 5), 13)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.rangeSum([1, 2, 3, 4], 4, 3, 4), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.rangeSum([1, 2, 3, 4], 4, 1, 10), 50)
    }
    
}

private class Solution {
    func rangeSum(_ nums: [Int], _ n: Int, _ left: Int, _ right: Int) -> Int {
        var sums = [Int]()
        
        for i in 0 ..< n {
            var sum = 0
            
            for j in i ..< n {
                sum += nums[j]
                sums.append(sum)
            }
        }
        
        sums.sort()
        
        return sums[left - 1 ... right - 1].reduce(into: 0) {
            $0 += $1
            $0 %= 1_000_000_007
        }
    }
}
