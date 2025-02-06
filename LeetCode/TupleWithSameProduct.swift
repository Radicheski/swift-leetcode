//
//  TupleWithSameProduct.swift
//  https://leetcode.com/problems/tuple-with-same-product/
//
//  Created by Erik Radicheski da Silva on 06/02/25.
//

import XCTest

final class TupleWithSameProduct: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.tupleSameProduct([2, 3, 4, 6]), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.tupleSameProduct([1, 2, 4, 5, 10]), 16)
    }
    
}

private class Solution {
    func tupleSameProduct(_ nums: [Int]) -> Int {
        var products = [Int: [(a: Int, b: Int)]]()
        
        for i in 0 ..< nums.endIndex - 1 {
            for j in i + 1 ..< nums.endIndex {
                let product = nums[i] * nums[j]
                products[product, default: []].append((nums[i], nums[j]))
            }
        }
        
        var count = 0
        
        for (_, list) in products {
            guard list.count > 1 else { continue }
            count += list.count * (list.count - 1) * 4
        }
        
        return count
    }
}
