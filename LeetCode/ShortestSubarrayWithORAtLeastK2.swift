//
//  ShortestSubarrayWithORAtLeastK2.swift
//  https://leetcode.com/problems/shortest-subarray-with-or-at-least-k-ii/
//
//  Created by Erik Radicheski da Silva on 10/11/24.
//

import XCTest

final class ShortestSubarrayWithORAtLeastK2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumSubarrayLength([1, 2, 3], 2), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumSubarrayLength([2, 1, 8], 10), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimumSubarrayLength([1, 2], 0), 1)
    }
    
}

private class Solution {
    func minimumSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var bits = Array(repeating: 0, count: Int.bitWidth)
        var answer = Int.max
        var left = 0
        var right = 0
        
        while right < nums.endIndex {
            for i in 0 ..< nums[right].bitWidth {
                bits[i] += (nums[right] & (1 << i) > 0) ? 1 : 0
            }
            
            while bits.enumerated().reduce(into: 0, { $0 |= ($1.element > 0) ? (1 << $1.offset) : 0 } ) >= k {
                guard left <= right else { break }
                
                answer = min(answer, right - left + 1)
                
                for i in 0 ..< nums[left].bitWidth {
                    bits[i] -= (nums[left] & (1 << i) > 0) ? 1 : 0
                }
                
                left += 1
            }
            
            right += 1
        }
        
        return answer == .max ? -1 : answer
    }
}
