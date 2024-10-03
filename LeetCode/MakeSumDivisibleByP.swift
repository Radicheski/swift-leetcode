//
//  MakeSumDivisibleByP.swift
//  https://leetcode.com/problems/make-sum-divisible-by-p/
//
//  Created by Erik Radicheski da Silva on 03/10/24.
//

import XCTest

final class MakeSumDivisibleByP: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minSubarray([3, 1, 4, 2], 6), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minSubarray([6, 3, 5, 2], 9), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minSubarray([1, 2, 3], 3), 0)
    }
    
}

private class Solution {
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        var totalSum = 0
        
        for num in nums {
            totalSum += num % p
            totalSum %= p
        }
        
        if totalSum == 0 { return 0 }
        
        var modMap = [0: -1]
        var currentSum = 0
        var minLength = nums.count
        
        for (i, num) in nums.enumerated() {
            currentSum += num % p
            currentSum %= p
            
            let needed = (currentSum - totalSum + p) % p
            
            if let index = modMap[needed] {
                minLength = min(minLength, i - index)
            }
            
            modMap[currentSum] = i
        }
        
        return minLength == nums.count ? -1 : minLength
    }
}
