//
//  MaximumValueAtAGivenIndexInABoundedArray.swift
//  https://leetcode.com/problems/maximum-value-at-a-given-index-in-a-bounded-array/
//
//  Created by Erik Radicheski da Silva on 10/06/23.
//

import XCTest

final class MaximumValueAtAGivenIndexInABoundedArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxValue(4, 2, 6), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxValue(6, 1, 10), 3)
    }

}

private class Solution {
    func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
        var left = 1
        var right = maxSum
        
        while left < right {
            let mid = (left + right + 1) / 2;
            if sum(index, mid, n) <= maxSum {
                left = mid;
            } else {
                right = mid - 1;
            }
        }
        
        return left
    }
    
    private func sum(_ index: Int, _ value: Int, _ n: Int) -> Int {
        var count = 0
        
        if value > index {
            count += (value + value - index) * (index + 1) / 2
        } else {
            count += (value + 1) * value / 2 + index - value + 1
        }
        
        if value >= n - index {
            count += (value + value - n + 1 + index) * (n - index) / 2
        } else {
            count += (value + 1) * value / 2 + n - index - value
        }
        
        return count - value
    }
}
