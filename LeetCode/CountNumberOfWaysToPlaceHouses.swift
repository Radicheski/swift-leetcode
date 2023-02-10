//
//  CountNumberOfWaysToPlaceHouses.swift
//  https://leetcode.com/problems/count-number-of-ways-to-place-houses/
//
//  Created by Erik Radicheski da Silva on 10/02/23.
//

import XCTest

final class CountNumberOfWaysToPlaceHouses: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countHousePlacements(1), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countHousePlacements(2), 9)
    }

}

private class Solution {
    func countHousePlacements(_ n: Int) -> Int {
        var a = 1
        var b = 1
        
        var result = 0
        
        for _ in 1 ... n {
            result = ((a % 1000000007) + (b % 1000000007)) % 1000000007
            a = b
            b = result
        }
        
        return ((result % 1000000007) * (result % 1000000007)) % 1000000007
    }
}
