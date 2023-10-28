//
//  CountVowelsPermutation.swift
//  https://leetcode.com/problems/count-vowels-permutation/
//
//  Created by Erik Radicheski da Silva on 28/10/23.
//

import XCTest

final class CountVowelsPermutation: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countVowelPermutation(1), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countVowelPermutation(2), 10)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countVowelPermutation(5), 68)
    }

}

private class Solution {
    
    private let mod = 1_000_000_007
    
    private let previous = [0: [1, 2, 4], 1: [0, 2], 2: [1, 3], 3: [2], 4: [2, 3]]
    
    func countVowelPermutation(_ n: Int) -> Int {
        guard n > 1 else { return 5 }
        
        var ways = Array(repeating: 1, count: 5)
        
        for _ in 2 ... n {
            var newWays = Array(repeating: 0, count: 5)
            
            for i in ways.indices {
                for j in previous[i] ?? [] {
                    newWays[i] += ways[j]
                    newWays[i] %= mod
                }
            }
            
            ways = newWays
        }
        
        return ways.map { $0 % mod }.reduce(into: 0, +=) % mod
    }
    
}
