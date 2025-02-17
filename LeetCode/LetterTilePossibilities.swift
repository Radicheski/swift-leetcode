//
//  LetterTilePossibilities.swift
//  https://leetcode.com/problems/letter-tile-possibilities/
//
//  Created by Erik Radicheski da Silva on 17/02/25.
//

import XCTest

final class LetterTilePossibilities: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numTilePossibilities("AAB"), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numTilePossibilities("AAABBC"), 188)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numTilePossibilities("V"), 1)
    }
    
}

private class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        let tiles = Array(tiles)
        var set = Set<[Character]>()
        var count = [Character: Int]()
        
        for tile in tiles {
            count[tile, default: 0] += 1
        }
        
        dfs([], count, &set)
        
        return set.count
    }
    
    private func dfs(_ base: [Character], _ count: [Character: Int], _ set: inout Set<[Character]>) {
        guard count.values.max() ?? 0 > 0 else { return }
        
        for (character, frequency) in count where frequency > 0 {
            var count = count
            count[character, default: 0] -= 1
            
            let newBase = base + [character]
            set.insert(newBase)
            dfs(newBase, count, &set)
        }
    }
}
