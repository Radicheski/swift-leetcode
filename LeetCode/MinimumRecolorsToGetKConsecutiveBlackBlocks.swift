//
//  MinimumRecolorsToGetKConsecutiveBlackBlocks.swift
//  https://leetcode.com/problems/minimum-recolors-to-get-k-consecutive-black-blocks/
//
//  Created by Erik Radicheski da Silva on 08/03/25.
//

import XCTest

final class MinimumRecolorsToGetKConsecutiveBlackBlocks: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumRecolors("WBBWWBBWBW", 7), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumRecolors("WBWBBBW", 2), 0)
    }
    
}

private class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        let blocks = Array(blocks)
        
        var changeCount = 0
        var minimumChange = Int.max
        
        for i in blocks.indices {
            changeCount += (blocks[i] == "W") ? 1 : 0
            
            guard i >= k - 1 else { continue }
            
            if i >= k {
                changeCount -= (blocks[i - k] == "W") ? 1 : 0
            }
            
            minimumChange = min(minimumChange, changeCount)
        }
        
        
        return minimumChange
    }
}
