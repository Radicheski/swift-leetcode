//
//  MaximumDistanceInArrays.swift
//  https://leetcode.com/problems/maximum-distance-in-arrays/
//
//  Created by Erik Radicheski da Silva on 16/08/24.
//

import XCTest

final class MaximumDistanceInArrays: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxDistance([[1, 2, 3], [4, 5], [1, 2, 3]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxDistance([[1], [1]]), 0)
    }
    
}

private class Solution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var minimum = [(array: Int, number: Int)]()
        var maximum = [(array: Int, number: Int)]()
        
        for (i, array) in arrays.enumerated() {
            minimum.append((i, array.first!))
            maximum.append((i, array.last!))
            
            minimum.sort { $0.number < $1.number }
            maximum.sort { $0.number > $1.number }
            
            while minimum.count > 2 {
                minimum.removeLast()
            }
            
            while maximum.count > 2 {
                maximum.removeLast()
            }
            
        }
        
        var answer = Int.min
        
        for (arrayI, minNumber) in minimum {
            for (arrayJ, maxNumber) in maximum where arrayI != arrayJ {
                answer = max(answer, abs(maxNumber - minNumber))
            }
        }
        
        return answer
    }
}
