//
//  BoatsToSavePeople.swift
//  https://leetcode.com/problems/boats-to-save-people/
//
//  Created by Erik Radicheski da Silva on 03/04/23.
//

import XCTest

final class BoatsToSavePeople: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numRescueBoats([1, 2], 3), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numRescueBoats([3, 2, 2, 1], 3), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numRescueBoats([3, 5, 3, 4], 5), 4)
    }

}

private class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let people = people.sorted()
        
        var boatCount = 0
        
        var left = 0
        var right = people.endIndex - 1
        
        while left <= right {
            if people[left] + people[right] <= limit {
                left += 1
            }
            
            right -= 1
            boatCount += 1
        }
        
        return boatCount
    }
}
