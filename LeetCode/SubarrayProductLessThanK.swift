//
//  SubarrayProductLessThanK.swift
//  https://leetcode.com/problems/subarray-product-less-than-k/
//
//  Created by Erik Radicheski da Silva on 23/10/22.
//

import XCTest

final class SubarrayProductLessThanK: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numSubarrayProductLessThanK([10, 5, 2, 6], 100), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numSubarrayProductLessThanK([1, 2, 3], 0), 0)
    }

}

private class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else { return 0 }
        
        var start = 0
        var product = 1
        var count = 0
        
        for i in 0 ..< nums.endIndex {
            product *= nums[i]
            
            while product >= k {
                product /= nums[start]
                start += 1
            }
            
            count += i - start + 1
        }
        
        return count
    }
}
