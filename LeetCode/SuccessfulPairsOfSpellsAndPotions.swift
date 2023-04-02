//
//  SuccessfulPairsOfSpellsAndPotions.swift
//  https://leetcode.com/problems/successful-pairs-of-spells-and-potions/
//
//  Created by Erik Radicheski da Silva on 02/04/23.
//

import XCTest

final class SuccessfulPairsOfSpellsAndPotions: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.successfulPairs([5, 1, 3], [1, 2, 3, 4, 5], 7), [4,0,3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.successfulPairs([3, 1, 2], [8, 5, 8], 16), [2, 0, 2])
    }

}

private class Solution {
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        var pairs = Array(repeating: 0, count: spells.count)
        let potions = potions.sorted(by: >)
        
        for (i, spell) in spells.enumerated() {
            let potionMinimumStrength = (success / spell) + (success.isMultiple(of: spell) ? 0 : 1)
            
            var left = potions.startIndex
            var right = potions.endIndex - 1
            
            while left <= right {
                let middle = left + (right - left) / 2
                if potions[middle] >= potionMinimumStrength {
                    left = middle + 1
                } else {
                    right = middle - 1
                }
            }
            
            pairs[i] = left
        }
        
        return pairs
    }
}
