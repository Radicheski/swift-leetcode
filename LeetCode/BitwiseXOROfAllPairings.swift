//
//  BitwiseXOROfAllPairings.swift
//  https://leetcode.com/problems/bitwise-xor-of-all-pairings/
//
//  Created by Erik Radicheski da Silva on 16/01/25.
//

import XCTest

final class BitwiseXOROfAllPairings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.xorAllNums([2, 1, 3], [10, 2, 5, 0]), 13)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.xorAllNums([1, 2], [3, 4]), 0)
    }
    
}

private class Solution {
    func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var nums = [Int: Int]()
        
        for num in nums1 {
            nums[num, default: 0] += nums2.count
        }
        
        for num in nums2 {
            nums[num, default: 0] += nums1.count
        }
        
        var answer = 0
        
        for (num, count) in nums {
            if count.isMultiple(of: 2) { continue }
            answer ^= num
        }
        
        return answer
    }
}
