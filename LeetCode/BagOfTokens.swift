//
//  BagOfTokens.swift
//  https://leetcode.com/problems/bag-of-tokens/
//
//  Created by Erik Radicheski da Silva on 04/03/24.
//

import XCTest

final class BagOfTokens: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.bagOfTokensScore([100], 50), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.bagOfTokensScore([200, 100], 150), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.bagOfTokensScore([100, 200, 300, 400], 200), 2)
    }
    
}

private class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        var score = 0
        var power = power
        
        var low = 0
        var high = tokens.endIndex - 1
        
        let tokens = tokens.sorted()
        
        while low <= high {
            if power >= tokens[low] {
                score += 1
                power -= tokens[low]
                low += 1
            } else if low < high && score > 0 {
                score -= 1
                power += tokens[high]
                high -= 1
            } else {
                break
            }
        }
        
        return score
    }
}
