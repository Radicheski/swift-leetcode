//
//  MinimizedMaximumOfProductsDistributedToAnyStore.swift
//  https://leetcode.com/problems/minimized-maximum-of-products-distributed-to-any-store/
//
//  Created by Erik Radicheski da Silva on 14/11/24.
//

import XCTest

final class MinimizedMaximumOfProductsDistributedToAnyStore: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimizedMaximum(6, [11, 6]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimizedMaximum(7, [15, 10, 10]), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimizedMaximum(1, [100000]), 100000)
    }
    
}

private class Solution {
    func minimizedMaximum(_ n: Int, _ quantities: [Int]) -> Int {
        var left = 0
        var right = quantities.max()!
        
        while left < right {
            let middle = left + (right - left) / 2
            
            var count = 0
            var quantity = quantities[count]
            
            var isPossible = false
            
            for _ in 0 ..< n {
                if quantity <= middle {
                    count += 1
                    if count == quantities.endIndex {
                        isPossible = true
                        break
                    } else {
                        quantity = quantities[count]
                    }
                } else {
                    quantity -= middle
                }
            }
            
            if isPossible {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
}
