//
//  ShortestPathToGetAllKeys.swift
//  https://leetcode.com/problems/shortest-path-to-get-all-keys/
//
//  Created by Erik Radicheski da Silva on 29/06/23.
//

import XCTest

final class ShortestPathToGetAllKeys: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shortestPathAllKeys(["@.a..", "###.#", "b.A.B"]), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shortestPathAllKeys(["@..aA", "..B#.", "....b"]), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.shortestPathAllKeys(["@Aa"]), -1)
    }

}

private class Solution {
    func shortestPathAllKeys(_ grid: [String]) -> Int {
        let grid = grid.map { Array($0) }
        
        let m = grid.count
        let n = grid[0].count
        
        var queue = [[Int]]()
        let moves = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        
        var seen = [Int: Set<[Int]>]()
        
        var keySet = Set<Character>()
        var lockSet = Set<Character>()
        
        var allKeys = 0
        var startR = -1
        var startC = -1
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                let cell = grid[i][j]
                if ("a" ... "f").contains(cell) {
                    allKeys += (1 << (cell.asciiValue! - Character("a").asciiValue!) as Int)
                    keySet.insert(cell)
                }
                
                if ("A" ... "F").contains(cell) {
                    lockSet.insert(cell)
                }
                
                if cell == "@" {
                    startR = i
                    startC = j
                }
            }
        }
        
        queue.append([startR, startC, 0, 0])
        seen[0, default: Set()].insert([startR, startC])
        
        while queue.isEmpty == false {
            let current = queue.removeFirst()
            
            let currentR = current[0]
            let currentC = current[1]
            let keys = current[2]
            let dist = current[3]
            
            for move in moves {
                let newR = currentR + move[0]
                let newC = currentC + move[1]
                
                if grid.indices.contains(newR) && grid[newR].indices.contains(newC) && grid[newR][newC] != "#" {
                    let cell = grid[newR][newC]
                    
                    if keySet.contains(cell) {
                        if (1 << (cell.asciiValue! - Character("a").asciiValue!) as Int) & keys != 0 {
                            continue
                        }
                        
                        let newKeys = keys | (1 << (cell.asciiValue! - Character("a").asciiValue!) as Int)
                        
                        if newKeys == allKeys {
                            return dist + 1
                        }
                        
                        seen[newKeys, default: Set()].insert([newR, newC])
                        queue.append([newR, newC, newKeys, dist + 1])
                    }
                    
                    if lockSet.contains(cell) && (1 << (cell.asciiValue! - Character("A").asciiValue!) as Int) & keys == 0 {
                        continue
                    } else if seen[keys, default: Set()].contains([newR, newC]) == false {
                        seen[keys, default: Set()].insert([newR, newC])
                        queue.append([newR, newC, keys, dist + 1])
                    }
                }
            }
        }
        
        return -1
    }
}
