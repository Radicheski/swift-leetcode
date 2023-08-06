//
//  NumberOfMusicPlaylists.swift
//  https://leetcode.com/problems/number-of-music-playlists/
//
//  Created by Erik Radicheski da Silva on 06/08/23.
//

import XCTest

final class NumberOfMusicPlaylists: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numMusicPlaylists(3, 3, 1), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numMusicPlaylists(2, 3, 0), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numMusicPlaylists(2, 3, 1), 2)
    }

}

private class Solution {
    private let mod = 1_000_000_007
    
    func numMusicPlaylists(_ n: Int, _ goal: Int, _ k: Int) -> Int {
        var dp  = Array(repeating: Array(repeating: 0, count: n + 1), count: goal + 1)
        dp[0][0] = 1
        
        for i in 1 ... goal {
            for j in 1 ... min(i, n) {
                dp[i][j] = dp[i - 1][j - 1] * (n - j + 1) % mod
                
                if j > k {
                    dp[i][j] = (dp[i][j] + dp[i - 1][j] * (j - k)) % mod
                }
            }
        }
        
        return dp[goal][n]
    }
}
