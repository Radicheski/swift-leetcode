//
//  CountNicePairsInAnArray.swift
//  https://leetcode.com/problems/count-nice-pairs-in-an-array/
//
//  Created by Erik Radicheski da Silva on 21/11/23.
//

import XCTest

final class CountNicePairsInAnArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countNicePairs([42, 11, 1, 97]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countNicePairs([13, 10, 35, 24, 76]), 4)
    }
    
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func countNicePairs(_ nums: [Int]) -> Int {
        var nums = nums.map { $0 - reverse($0) }
        
        var answer = 0
        var counts = [Int: Int]()
        
        for num in nums {
            if let count = counts[num] {
                answer += count
                counts[num] = (count + 1) % mod
            } else {
                counts[num] = 1
            }
            answer %= mod
        }
        
        return answer
    }
    
    private func reverse(_ num: Int) -> Int {
        var num = num
        var rev = 0
        
        while num > 0 {
            rev *= 10
            rev += num % 10
            num /= 10
        }
        
        return rev
    }
}
