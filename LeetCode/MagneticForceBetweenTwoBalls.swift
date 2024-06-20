//
//  MagneticForceBetweenTwoBalls.swift
//  https://leetcode.com/problems/magnetic-force-between-two-balls/
//
//  Created by Erik Radicheski da Silva on 20/06/24.
//

import XCTest

final class MagneticForceBetweenTwoBalls: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxDistance([1, 2, 3, 4, 7], 3), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxDistance([5, 4, 3, 2, 1, 1000000000], 2), 999999999)
    }
    
}

private class Solution {
    func maxDistance(_ position: [Int], _ m: Int) -> Int {
        let position = position.sorted()
        var answer = 0
        
        var left = 1
        var right = Int(ceil(Double(position.last!) / Double(m - 1)))
        
        while left <= right {
            
            var gap = left + (right - left) / 2
            var previousPosition = position[0]
            var remainingBalls = m - 1
            
            for pos in position[1...] {
                guard remainingBalls > 0 else { break }
                guard pos - previousPosition >= gap else { continue }
                previousPosition = pos
                remainingBalls -= 1
            }
            
            if remainingBalls == 0 {
                answer = max(answer, gap)
                left = gap + 1
            } else {
                right = gap - 1
            }
            
        }
        
        return answer
    }
}
