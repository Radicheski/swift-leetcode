//
//  AllPathsFromSourceToTarget.swift
//  https://leetcode.com/problems/all-paths-from-source-to-target/
//
//  Created by Erik Radicheski da Silva on 26/10/22.
//

import XCTest

final class AllPathsFromSourceToTarget: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.allPathsSourceTarget([[1, 2], [3], [3], []]), [[0, 1, 3], [0, 2, 3]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.allPathsSourceTarget([[4, 3, 1], [3, 2, 4], [3], [4], []]),
                       [[0, 4], [0, 3, 4], [0, 1, 3, 4], [0, 1, 2, 3, 4], [0, 1, 4]])
    }
}

private class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let target = graph.endIndex - 1
        
        var result = [[0]]
        
        repeat {
            var next = [[Int]]()
            
            for path in result {
                if let last = path.last {
                    if last == target {
                        next.append(path)
                    } else {
                        graph[last]
                            .map { path + [$0] }
                            .forEach { next.append($0) }
                    }
                }
            }
            
            result = next
        } while !result.allSatisfy( { $0.last == target } )
        
        return result
    }
}
