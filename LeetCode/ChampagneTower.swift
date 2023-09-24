//
//  ChampagneTower.swift
//  https://leetcode.com/problems/champagne-tower/
//
//  Created by Erik Radicheski da Silva on 24/09/23.
//

import XCTest

final class ChampagneTower: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.champagneTower(1, 1, 1), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.champagneTower(2, 1, 1), 0.5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.champagneTower(100000009, 33, 17), 1)
    }

}

private class Solution {
    func champagneTower(_ poured: Int, _ queryRow: Int, _ queryGlass: Int) -> Double {
        var glasses = (1 ... 100).map { Array(repeating: 0.0, count: $0) }
        glasses[0][0] = Double(poured)
        
        for i in glasses.indices where i < 99 {
            for j in glasses[i].indices {
                guard glasses[i][j] > 1 else { continue }
                
                let excess = glasses[i][j] - 1
                
                glasses[i][j] = 1
                glasses[i + 1][j] += excess / 2
                glasses[i + 1][j + 1] += excess / 2
            }
        }
        
        glasses[99] = glasses[99].map { min($0, 1) }
        
        return glasses[queryRow][queryGlass]
    }
}
