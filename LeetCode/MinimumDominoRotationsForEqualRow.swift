//
//  MinimumDominoRotationsForEqualRow.swift
//  https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/
//
//  Created by Erik Radicheski da Silva on 03/05/25.
//

import XCTest

final class MinimumDominoRotationsForEqualRow: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minDominoRotations([2, 1, 2, 4, 2, 2], [5, 2, 6, 2, 3, 2]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minDominoRotations([3, 5, 1, 2, 3], [3, 6, 3, 3, 4]), -1)
    }
    
}

private class Solution {
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        let top = check(tops, bottoms, tops[0])
        let bottom = check(tops, bottoms, bottoms[0])
        
        return max(top, bottom)
    }
    
    private func check(_ tops: [Int], _ bottoms: [Int], _ number: Int) -> Int {
        var moves = (top: 0, bottom: 0)
        
        for i in tops.indices {
            guard tops[i] == number || bottoms[i] == number else { return -1 }
            
            if tops[i] != number {
                moves.top += 1
            }
            
            if bottoms[i] != number {
                moves.bottom += 1
            }
        }
        
        return min(moves.top, moves.bottom)
    }
}
