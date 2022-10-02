//
//  ProductOfArrayExceptSelf.swift
//  https://leetcode.com/problems/product-of-array-except-self/
//
//  Created by Erik Radicheski da Silva on 02/10/22.
//

import XCTest

final class ProductOfArrayExceptSelf: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.productExceptSelf([1, 2, 3, 4]), [24, 12, 8, 6])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.productExceptSelf([-1, 1, 0, -3, 3]), [0,0,9,0,0])
    }

}

private class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var preffix = Array(repeating: 1, count: nums.count)
        
        for i in 1 ..< nums.count {
            preffix[i] = preffix[i - 1] * nums[i - 1]
        }
        
        var suffix = Array(repeating: 1, count: nums.count)
        
        for i in 2 ... nums.count {
            suffix[nums.count - i] = suffix[nums.count - i + 1] * nums[nums.count - i + 1]
        }
        
        var result = [Int]()
        
        for i in 0 ..< nums.count {
            result.append(preffix[i] * suffix[i])
        }
        
        return result
    }
}
