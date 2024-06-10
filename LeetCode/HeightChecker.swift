//
//  HeightChecker.swift
//  https://leetcode.com/problems/height-checker/
//
//  Created by Erik Radicheski da Silva on 10/06/24.
//

import XCTest

final class HeightChecker: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.heightChecker([1, 1, 4, 2, 1, 3]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.heightChecker([5, 1, 2, 3, 4]), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.heightChecker([1, 2, 3, 4, 5]), 0)
    }
    
}

private class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var count = 0
        
        for (i, height) in heights.sorted().enumerated() where height != heights[i] {
            count += 1
        }
        
        return count
    }
}
