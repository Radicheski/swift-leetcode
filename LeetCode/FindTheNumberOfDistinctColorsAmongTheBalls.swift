//
//  FindTheNumberOfDistinctColorsAmongTheBalls.swift
//  https://leetcode.com/problems/find-the-number-of-distinct-colors-among-the-balls/
//
//  Created by Erik Radicheski da Silva on 08/02/25.
//

import XCTest

final class FindTheNumberOfDistinctColorsAmongTheBalls: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.queryResults(4, [[1, 4], [2, 5], [1, 3], [3, 4]]), [1, 2, 2, 3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.queryResults(4, [[0, 1], [1, 2], [2, 2], [3, 4], [4, 5]]), [1, 2, 2, 3, 4])
    }
    
}

private class Solution {
    func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
        var answer = [Int]()
        
        var balls = [Int: Int]()
        var colors = [Int: Int]()
        var colorCount = 0
        
        for query in queries {
            let (ball, color) = (query[0], query[1])
            
            if let previousColor = balls[ball] {
                colors[previousColor, default: 0] -= 1
                if colors[previousColor] == 0 {
                    colorCount -= 1
                }
            }
            
            balls[ball] = color

            if colors[color, default: 0] == 0 {
                colorCount += 1
            }
            colors[color, default: 0] += 1
            
            answer.append(colorCount)
        }
        
        return answer
    }
}
