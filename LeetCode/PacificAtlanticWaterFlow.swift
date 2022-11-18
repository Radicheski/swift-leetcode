//
//  PacificAtlanticWaterFlow.swift
//  https://leetcode.com/problems/pacific-atlantic-water-flow/
//
//  Created by Erik Radicheski da Silva on 18/11/22.
//

import XCTest

final class PacificAtlanticWaterFlow: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = [[1, 2, 2, 3, 5], [3, 2, 3, 4, 4], [2, 4, 5, 3, 1], [6, 7, 1, 4, 5], [5, 1, 1, 2, 4]]
        let expectedOutput = Set([[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]])
        XCTAssertEqual(Set(solution.pacificAtlantic(input)), expectedOutput)
    }
    
    func testExampleB() {
        let input = [[1]]
        let expectedOutput = Set([[0, 0]])
        XCTAssertEqual(Set(solution.pacificAtlantic(input)), expectedOutput)
    }
    
}

private class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let maxM = heights.endIndex - 1
        let maxN = heights[0].endIndex - 1
        
        var atlanticQueue = [[Int]]()
        var pacificQueue = [[Int]]()
        
        var atlanticVisited = heights.map { $0.map { _ in false } }
        var pacificVisited = heights.map { $0.map { _ in false } }
        
        for m in 0 ... maxM {
            atlanticQueue.append([m, maxN])
            pacificQueue.append([m, 0])
        }
        
        for n in 0 ... maxN {
            atlanticQueue.append([maxM, n])
            pacificQueue.append([0, n])
        }
        
        flood(heights, atlanticQueue, &atlanticVisited)
        flood(heights, pacificQueue, &pacificVisited)
        
        var result = [[Int]]()
        
        for m in 0 ... maxM {
            for n in 0 ... maxN {
                if pacificVisited[m][n] && atlanticVisited[m][n] {
                    result.append([m, n])
                }
            }
        }
        
        return result
    }
    
    private func flood(_ heights: [[Int]], _ queue: [[Int]], _ isVisited: inout [[Bool]]) {
        let dm = [0, 0, -1, 1]
        let dn = [-1, 1, 0, 0]
        
        var queue = queue
        
        while queue.isEmpty == false {
            let coordinate = queue.removeFirst()
            let m = coordinate[0]
            let n = coordinate[1]
            
            isVisited[m][n] = true
            
            for i in 0 ..< 4 {
                let newM = m + dm[i]
                let newN = n + dn[i]
                
                if inRange(heights, newM, newN)
                    && heights[newM][newN] >= heights[m][n]
                    && isVisited[newM][newN] == false {
                    queue.append([newM, newN])
                    isVisited[newM][newN] = true
                }
            }
        }
    }
    
    private func inRange(_ heights: [[Int]], _ m: Int, _ n: Int) -> Bool {
        (0 ..< heights.endIndex).contains(m) && (0 ..< heights[0].endIndex).contains(n)
    }
}
