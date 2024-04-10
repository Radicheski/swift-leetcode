//
//  RevealCardsInIncreasingOrder.swift
//  https://leetcode.com/problems/reveal-cards-in-increasing-order/
//
//  Created by Erik Radicheski da Silva on 10/04/24.
//

import XCTest

final class RevealCardsInIncreasingOrder: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.deckRevealedIncreasing([17, 13, 11, 2, 3, 5, 7]), [2, 13, 3, 11, 5, 17, 7])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.deckRevealedIncreasing([1, 1000]), [1, 1000])
    }

}

private class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        let deck = deck.sorted()
        
        var result = Array(repeating: 0, count: deck.count)
        var resultIndex = 0
        var deckIndex = 0
        var skip = false
        
        while deckIndex < deck.endIndex {
            if result[resultIndex] == 0 {
                if skip == false {
                    result[resultIndex] = deck[deckIndex]
                    deckIndex += 1
                }
                
                skip = !skip
            }
            
            resultIndex = (resultIndex + 1) % deck.count
        }
        
        return result
    }
}
