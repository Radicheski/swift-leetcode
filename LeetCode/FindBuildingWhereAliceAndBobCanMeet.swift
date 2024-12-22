//
//  FindBuildingWhereAliceAndBobCanMeet.swift
//  https://leetcode.com/problems/find-building-where-alice-and-bob-can-meet/
//
//  Created by Erik Radicheski da Silva on 22/12/24.
//

import XCTest

final class FindBuildingWhereAliceAndBobCanMeet: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.leftmostBuildingQueries([6, 4, 8, 5, 2, 7], [[0, 1], [0, 3], [2, 4], [3, 4], [2, 2]]), [2, 5, -1, 5, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.leftmostBuildingQueries([5, 3, 8, 2, 6, 1, 4, 6], [[0, 7], [3, 5], [5, 2], [3, 0], [1, 6]]), [7, 6, -1, 4, 6])
    }
    
}

private class Solution {
    func leftmostBuildingQueries(_ heights: [Int], _ queries: [[Int]]) -> [Int] {
        var stack = [(height: Int, index: Int)]()
        var result = Array(repeating: -1, count: queries.count)
        var newQueries = [Int: [(height: Int, index: Int)]]()
        
        for (i, query) in queries.enumerated() {
            if query[0] == query[1] {
                result[i] = query[0]
            } else {
                let a = min(query[0], query[1])
                let b = max(query[0], query[1])
                
                if heights[a] < heights[b] {
                    result[i] = b
                } else {
                    newQueries[b, default: []].append((heights[a], i))
                }
            }
        }
        
        for i in heights.indices.reversed() {
            for (height, index) in newQueries[i] ?? [] {
                let position = search(height, stack)
                
                if stack.indices.contains(position) {
                    result[index] = stack[position].index
                }
            }
            
            while let lastHeight = stack.last?.height, lastHeight <= heights[i] {
                let _ = stack.removeLast()
            }
            
            stack.append((heights[i], i))
        }
        
        return result
    }
    
    private func search(_ height: Int, _ stack: [(height: Int, index: Int)]) -> Int {
        var left = 0
        var right = stack.endIndex - 1
        var answer = -1
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if height < stack[middle].height {
                answer = max(answer, middle)
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        return answer
    }
    
}
