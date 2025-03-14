//
//  MaximumCandiesAllocatedToKChildren.swift
//  https://leetcode.com/problems/maximum-candies-allocated-to-k-children/
//
//  Created by Erik Radicheski da Silva on 14/03/25.
//

import XCTest

final class MaximumCandiesAllocatedToKChildren: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumCandies([5, 8, 6], 3), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumCandies([2, 5], 11), 0)
    }
    
}

private class Solution {
    func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
        let candiesCount = candies.reduce(into: 0, +=)
        guard candiesCount >= k else { return 0 }
        
        var left = 0
        var right = candiesCount
        var answer = 0
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if divide(candies, k, middle) {
                left = middle + 1
                answer = middle
            } else {
                right = middle - 1
            }
        }
        
        return answer
    }
    
    private func divide(_ candies: [Int], _ k: Int, _ c: Int) -> Bool {
        if c == 0 { return true }
        
        var k = k
        
        for candy in candies {
            if k <= 0 { return true }
            
            k -= candy / c
        }
        
        return k <= 0
    }
}
