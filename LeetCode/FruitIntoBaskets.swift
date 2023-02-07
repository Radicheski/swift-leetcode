//
//  FruitIntoBaskets.swift
//  https://leetcode.com/problems/fruit-into-baskets/
//
//  Created by Erik Radicheski da Silva on 07/02/23.
//

import XCTest

final class FruitIntoBaskets: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.totalFruit([1, 2, 1]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.totalFruit([0, 1, 2, 2]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.totalFruit([1, 2, 3, 2, 2]), 4)
    }
    
}

private class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var maxLength = 0
        
        var start = 0
        var end = 0
        
        var trees = [Int: Int]()
        
        while end < fruits.endIndex || start < fruits.endIndex - maxLength {
            trees[fruits[end], default: 0] += 1
            
            while trees.count > 2 {
                trees[fruits[start]]? -= 1
                if trees[fruits[start]] == 0 {
                    trees[fruits[start]] = nil
                }
                start += 1
            }
            
            maxLength = max(maxLength, end - start + 1)
            
            end += 1
        }
        
        return maxLength
    }
}
