//
//  CountServersThatCommunicate.swift
//  https://leetcode.com/problems/count-servers-that-communicate/
//
//  Created by Erik Radicheski da Silva on 23/01/25.
//

import XCTest

final class CountServersThatCommunicate: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countServers([[1, 0], [0, 1]]), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countServers([[1, 0], [1, 1]]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countServers([[1, 1, 0, 0], [0, 0, 1, 0], [0, 0, 1, 0], [0, 0, 0, 1]]), 4)
    }
    
}

private class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var servers = Set<[Int]>()
        var visitedRows = Array(repeating: false, count: m)
        var visitedColumns = Array(repeating: false, count: n)
        
        for i in grid.indices {
            for j in grid[i].indices {
                if grid[i][j] == 1 {
                    servers.insert([i, j])
                }
            }
        }
        
        var count = 0
        
        while let server = servers.popFirst() {
            var currentCount = 0
            var queue = [server]
            
            while let nextServer = queue.popLast() {
                currentCount += 1
                
                if visitedColumns[nextServer[1]] == false {
                    visitedColumns[nextServer[1]] = true
                    for i in 0 ..< m {
                        if let connectedServer = servers.remove([i, nextServer[1]]) {
                            queue.append(connectedServer)
                        }
                    }
                }
                
                if visitedRows[nextServer[0]] == false {
                    visitedRows[nextServer[0]] = true
                    for j in 0 ..< n {
                        if let connectedServer = servers.remove([nextServer[0], j]) {
                            queue.append(connectedServer)
                        }
                    }
                }
            }
            
            if currentCount > 1 {
                count += currentCount
            }
        }
        
        return count
    }
}
