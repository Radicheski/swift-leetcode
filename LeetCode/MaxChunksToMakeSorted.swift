//
//  MaxChunksToMakeSorted.swift
//  https://leetcode.com/problems/max-chunks-to-make-sorted/
//
//  Created by Erik Radicheski da Silva on 19/12/24.
//

import XCTest

final class MaxChunksToMakeSorted: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxChunksToSorted([4, 3, 2, 1, 0]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxChunksToSorted([1,0,2,3,4]), 4)
    }
    
}

private class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var chunks = 0
        var maximum = 0
        
        for (i, num) in arr.enumerated() {
            maximum = max(maximum, num)
            
            if i == maximum {
                chunks += 1
            }
        }
        
        return chunks
    }
}
