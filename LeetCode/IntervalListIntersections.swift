//
//  IntervalListIntersections.swift
//  https://leetcode.com/problems/interval-list-intersections/
//
//  Created by Erik Radicheski da Silva on 22/10/22.
//

import XCTest

final class IntervalListIntersections: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let firstList = [[0, 2], [5, 10], [13, 23], [24, 25]]
        let secondList = [[1, 5], [8, 12], [15, 24], [25, 26]]
        let expectedOutput = [[1, 2], [5, 5], [8, 10], [15, 23], [24, 24], [25, 25]]
        XCTAssertEqual(solution.intervalIntersection(firstList, secondList), expectedOutput)
    }
    
    func testExampleB() {
        let firstList = [[1,3],[5,9]]
        let secondList = [[Int]]()
        let expectedOutput = [[Int]]()
        XCTAssertEqual(solution.intervalIntersection(firstList, secondList), expectedOutput)
    }
}

private class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        guard firstList.isEmpty == false else { return result }
        guard secondList.isEmpty == false else { return result }
        
        var firstIndex = 0
        var secondIndex = 0
        
        while firstIndex < firstList.endIndex && secondIndex < secondList.endIndex {
            let (firstStart, firstEnd) = (firstList[firstIndex][0], firstList[firstIndex][1])
            let (secondStart, secondEnd) = (secondList[secondIndex][0], secondList[secondIndex][1])
            
            let newStart = max(firstStart, secondStart)
            let newEnd = min(firstEnd, secondEnd)
            
            if newStart <= newEnd {
                result.append([newStart, newEnd])
            }
            
            if firstEnd <= secondEnd {
                firstIndex += 1
            }
            
            if firstEnd >= secondEnd {
                secondIndex += 1
            }
         }
        
        return result
    }
}
