//
//  KokoEatingBananas.swift
//  https://leetcode.com/problems/koko-eating-bananas/
//
//  Created by Erik Radicheski da Silva on 08/03/23.
//

import XCTest

final class KokoEatingBananas: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minEatingSpeed([3, 6, 7, 11], 8), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minEatingSpeed([30, 11, 23, 4, 20], 5), 30)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minEatingSpeed([30, 11, 23, 4, 20], 6), 23)
    }
    
}

private class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        guard var maximum = piles.max() else { fatalError() }
        
        guard piles.count < h else { return maximum }
        
        var minimum = 1
        
        while minimum < maximum {
            let bananaRate = minimum + (maximum - minimum) / 2
            
            var time = 0
            
            for pile in piles {
                time += pile / bananaRate
                if pile % bananaRate != 0 {
                    time += 1
                }
            }
            
            if time > h {
                minimum = bananaRate + 1
            } else {
                maximum = bananaRate
            }
            
        }
        
        return minimum
    }
}
