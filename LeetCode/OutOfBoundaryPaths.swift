//
//  OutOfBoundaryPaths.swift
//  https://leetcode.com/problems/out-of-boundary-paths/
//
//  Created by Erik Radicheski da Silva on 26/01/24.
//

import XCTest

final class OutOfBoundaryPaths: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findPaths(2, 2, 2, 0, 0), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findPaths(1, 3, 3, 0, 1), 12)
    }
    
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        var memo = [Int: [Int: [Int: Int]]]()
        return findPaths(m, n, maxMove, startRow, startColumn, &memo)
    }
    
    private func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ x: Int, _ y: Int, _ memo: inout [Int: [Int: [Int: Int]]]) -> Int {
        guard (0 ..< m).contains(x) else { return 1 }
        guard (0 ..< n).contains(y) else { return 1 }
        guard maxMove > 0 else { return 0 }
        
        if let answer = memo[x]?[y]?[maxMove] {
            return answer
        }
        
        var answer = 0
        
        for step in [-1, 1] {
            answer += findPaths(m, n, maxMove - 1, x + step, y, &memo)
            answer %= mod
            
            answer += findPaths(m, n, maxMove - 1, x, y + step, &memo)
            answer %= mod
        }
        
        memo[x, default: [:]][y, default: [:]][maxMove] = answer
        return answer
    }
}
