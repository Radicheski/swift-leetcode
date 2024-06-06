//
//  HandOfStraights.swift
//  https://leetcode.com/problems/hand-of-straights/
//
//  Created by Erik Radicheski da Silva on 06/06/24.
//

import XCTest

final class HandOfStraights: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isNStraightHand([1, 2, 3, 6, 2, 3, 4, 7, 8], 3))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.isNStraightHand([1, 2, 3, 4, 5], 4))
    }
    
}

private class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        var hand = hand.sorted()
        
        while hand.isEmpty == false {
            let card = hand.removeFirst()
            
            var k = 1
            var i = 0
            
            while i < hand.endIndex && k < groupSize {
                if hand[i] == card + k {
                    k += 1
                    hand.remove(at: i)
                } else {
                    i += 1
                }
            }
            
            guard k == groupSize else { return false }
        }
        
        return true
    }
}
