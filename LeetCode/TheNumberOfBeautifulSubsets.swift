//
//  TheNumberOfBeautifulSubsets.swift
//  https://leetcode.com/problems/the-number-of-beautiful-subsets/
//
//  Created by Erik Radicheski da Silva on 23/05/24.
//

import XCTest

final class TheNumberOfBeautifulSubsets: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.beautifulSubsets([2, 4, 6], 2), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.beautifulSubsets([1], 1), 1)
    }
    
}

private class Solution {
    func beautifulSubsets(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else { return 1 }
        
        var answer = 0
        
        for subset in 1 ..< (1 << nums.count) {
            
            var isBeautiful = true
            
            for i in 0 ..< 19 where subset & (1 << i) > 0 {
                for j in i + 1 ..< 20 where subset & (1 << j) > 0 {
                    if abs(nums[i] - nums[j]) == k {
                        isBeautiful =  false
                    }
                }
            }
            
            answer += isBeautiful ? 1 : 0
        }
        
        return answer
    }
}
