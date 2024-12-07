//
//  MinimumLimitOfBallsInABag.swift
//  https://leetcode.com/problems/minimum-limit-of-balls-in-a-bag/
//
//  Created by Erik Radicheski da Silva on 07/12/24.
//

import XCTest

final class MinimumLimitOfBallsInABag: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumSize([9], 2), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumSize([2, 4, 8, 2], 4), 2)
    }
    
}

private class Solution {
    func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
        var left = 1
        var right = nums.reduce(into: 0) { $0 = max($0, $1)}
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if isPossible(middle, maxOperations, nums) {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
    
    private func isPossible(_ size: Int, _ maxOperation: Int, _ nums: [Int]) -> Bool {
        var operations = 0
        
        for num in nums {
            let count = ceil(Double(num) / Double(size)) - 1
            operations += Int(count)
            
            guard operations <= maxOperation else { return false }
        }
        
        return true
    }
}
