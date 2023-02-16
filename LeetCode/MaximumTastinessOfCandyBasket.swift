//
//  MaximumTastinessOfCandyBasket.swift
//  https://leetcode.com/problems/maximum-tastiness-of-candy-basket/
//
//  Created by Erik Radicheski da Silva on 16/02/23.
//

import XCTest

final class MaximumTastinessOfCandyBasket: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumTastiness([13, 5, 1, 8, 21, 2], 3), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumTastiness([1, 3, 1], 2), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumTastiness([7, 7, 7, 7], 2), 0)
    }

}

private class Solution {
    func maximumTastiness(_ price: [Int], _ k: Int) -> Int {
        let price = price.sorted()
        
        var left = 0
        var right = price.last! - price.first!
        
        while left < right {
            let middle = (left + right) / 2 + 1
            if search(target: middle, price: price, k: k) {
                left = middle
            } else {
                right = middle - 1
            }
        }
        
        return left
    }
    
    private func search(target: Int, price: [Int], k: Int) -> Bool {
        var previous = price[0]
        var counter = 1
        
        for i in 1 ..< price.endIndex {
            if price[i] - previous >= target {
                counter += 1
                previous = price[i]
            }
            
            if counter == k { return true }
        }
        
        return false
    }
}
