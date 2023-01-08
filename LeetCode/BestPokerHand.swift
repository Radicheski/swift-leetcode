//
//  BestPokerHand.swift
//  https://leetcode.com/problems/best-poker-hand/
//
//  Created by Erik Radicheski da Silva on 08/01/23.
//

import XCTest

final class BestPokerHand: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.bestHand([13, 2, 3, 1, 9], ["a", "a", "a", "a", "a"]), "Flush")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.bestHand([4, 4, 2, 4, 4], ["d", "a", "a", "b", "c"]), "Three of a Kind")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.bestHand([10, 10, 2, 12, 9], ["a", "b", "c", "a", "d"]), "Pair")
    }

}

private class Solution {
    
    private let flush = "Flush"
    private let threeOfKind = "Three of a Kind"
    private let pair = "Pair"
    private let highCard = "High Card"
    
    func bestHand(_ ranks: [Int], _ suits: [Character]) -> String {
        guard Set(suits).count > 1 else { return flush }
        
        let count = Dictionary(ranks.map { ($0, 1) }, uniquingKeysWith: +)
        
        switch count.values.max()! {
        case 3...:
            return threeOfKind
        case 2:
            return pair
        case 1:
            return highCard
        default:
            fatalError()
        }
    }
}
