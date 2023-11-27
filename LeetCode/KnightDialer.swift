//
//  KnightDialer.swift
//  https://leetcode.com/problems/knight-dialer/
//
//  Created by Erik Radicheski da Silva on 27/11/23.
//

import XCTest

final class KnightDialer: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.knightDialer(1), 10)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.knightDialer(2), 20)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.knightDialer(3131), 136006598)
    }
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    private let jumps = [[4, 6], [6, 8], [7, 9], [4, 8], [3, 9, 0],
                         [], [1, 7, 0], [2, 6], [1, 3], [2, 4]]
    
    func knightDialer(_ n: Int) -> Int {
        var answer = 0
        var memo = Array(repeating: [Int: Int](), count: jumps.count)
        
        for i in jumps.indices {
            answer += jump(i, n - 1, &memo)
            answer %= mod
        }
        
        return answer
    }
    
    private func jump(_ square: Int, _ n: Int, _ memo: inout [[Int: Int]]) -> Int {
        guard n > 0 else { return 1 }
        
        if let answer = memo[square][n] {
            return answer
        }
        
        var answer = 0
        
        for i in jumps[square] {
            answer += jump(i, n - 1, &memo)
            answer %= mod
        }
        
        memo[square][n] = answer
        
        return answer
    }
}
