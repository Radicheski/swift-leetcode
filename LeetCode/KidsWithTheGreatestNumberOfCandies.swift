//
//  KidsWithTheGreatestNumberOfCandies.swift
//  https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/
//
//  Created by Erik Radicheski da Silva on 17/04/23.
//

import XCTest

final class KidsWithTheGreatestNumberOfCandies: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.kidsWithCandies([2, 3, 5, 1, 3], 3), [true, true, true, false, true])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.kidsWithCandies([4, 2, 1, 1, 2], 1), [true, false, false, false, false])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.kidsWithCandies([12, 1, 12], 10), [true, false, true])
    }

}

private class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        var maxCandies = Int.min
        var newCandies = candies
        var result = Array(repeating: false, count: candies.count)
        
        for i in newCandies.indices {
            maxCandies = max(maxCandies, newCandies[i])
            newCandies[i] += extraCandies
        }
        
        for i in newCandies.indices {
            result[i] = newCandies[i] >= maxCandies
        }
        
        return result
    }
}
