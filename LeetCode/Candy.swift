//
//  Candy.swift
//  https://leetcode.com/problems/candy/
//
//  Created by Erik Radicheski da Silva on 13/09/23.
//

import XCTest

final class Candy: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.candy([1, 0, 2]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.candy([1, 2, 2]), 4)
    }

}

private class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var candies = ratings.map { _ in 1 }
        var indices = ratings.indices
        var notReady: Bool

        repeat {
            notReady = false
            for (i, rating) in ratings.enumerated() {
                if indices.contains(i - 1) && ratings[i - 1] < rating && candies[i - 1] >= candies[i] {
                    candies[i] = candies[i - 1] + 1
                    notReady = true
                }
                
                if indices.contains(i + 1) && ratings[i + 1] < rating && candies[i + 1] >= candies[i] {
                    candies[i] = candies[i + 1] + 1
                    notReady = true
                }
            }
        } while notReady
        
        return candies.reduce(into: 0, +=)
    }
}
