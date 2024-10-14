//
//  MaximalScoreAfterApplyingKOperations.swift
//  https://leetcode.com/problems/maximal-score-after-applying-k-operations/
//
//  Created by Erik Radicheski da Silva on 14/10/24.
//

import XCTest

final class MaximalScoreAfterApplyingKOperations: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxKelements([10, 10, 10, 10, 10], 5), 50)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxKelements([1, 10, 3, 3, 3], 3), 17)
    }
    
}

private class Solution {
    func maxKelements(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
        var score = 0
        
        for _ in 0 ..< k {
            let maxNumber = nums.removeLast()
            score += maxNumber
            insert(maxNumber / 3 + (maxNumber.isMultiple(of: 3) ? 0 : 1), into: &nums)
        }
        
        return score
    }
    
    private func insert(_ num: Int, into nums: inout [Int]) {
        if let last = nums.last, num >= last {
            nums.append(num)
            return
        }
        
        if let first = nums.first, num <= first {
            nums.insert(num, at: 0)
            return
        }
        
        var left = 0
        var right = nums.endIndex - 1
        var middle = 0
        
        while left < right {
            middle = left + (right - left) / 2
            
            if num == nums[middle] {
                nums.insert(num, at: middle)
                return
            } else if num < nums[middle] {
                right = middle
            } else if num > nums[middle] {
                left = middle + 1
            }
        }
        
        nums.insert(num, at: left)
    }
}
