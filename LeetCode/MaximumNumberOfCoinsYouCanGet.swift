//
//  MaximumNumberOfCoinsYouCanGet.swift
//  https://leetcode.com/problems/maximum-number-of-coins-you-can-get/
//
//  Created by Erik Radicheski da Silva on 24/11/23.
//

import XCTest

final class MaximumNumberOfCoinsYouCanGet: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxCoins([2, 4, 1, 2, 7, 8]), 9)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxCoins([2, 4, 5]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxCoins([9, 8, 7, 6, 5, 1, 2, 3, 4]), 18)
    }
    
}

private class Solution {
    func maxCoins(_ piles: [Int]) -> Int {
        var piles = piles.sorted(by: >)
        let n = piles.count / 3
        
        piles.removeLast(n)
        
        var answer = 0
        
        for (i, pile) in piles.enumerated() where i.isMultiple(of: 2) == false {
            answer += pile
        }
        
        return answer
    }
}
