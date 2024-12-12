//
//  TakeGiftsFromTheRichestPile.swift
//  https://leetcode.com/problems/take-gifts-from-the-richest-pile/
//
//  Created by Erik Radicheski da Silva on 12/12/24.
//

import XCTest

final class TakeGiftsFromTheRichestPile: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.pickGifts([25, 64, 9, 4, 100], 4), 29)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.pickGifts([1, 1, 1, 1], 4), 4)
    }
    
}

private class Solution {
    func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
        var gifts = gifts.sorted(by: <)
        
        for _ in 0 ..< k {
            let pile = Double(gifts.removeLast())
            gifts.append(Int(sqrt(pile)))
            gifts.sort(by: <)
        }
        
        return gifts.reduce(into: 0, +=)
    }
}
