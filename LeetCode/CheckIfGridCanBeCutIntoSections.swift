//
//  CheckIfGridCanBeCutIntoSections.swift
//  https://leetcode.com/problems/check-if-grid-can-be-cut-into-sections/
//
//  Created by Erik Radicheski da Silva on 25/03/25.
//

import XCTest

final class CheckIfGridCanBeCutIntoSections: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.checkValidCuts(5, [[1, 0, 5, 2], [0, 2, 2, 4], [3, 2, 5, 3], [0, 4, 4, 5]]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.checkValidCuts(4, [[0, 0, 1, 1], [2, 0, 3, 4], [0, 2, 2, 3], [3, 0, 4, 3]]))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.checkValidCuts(4, [[0, 2, 2, 4], [1, 0, 3, 2], [2, 2, 3, 4], [3, 0, 4, 2], [3, 2, 4, 4]]))
    }
    
}

private class Solution {
    func checkValidCuts(_ n: Int, _ rectangles: [[Int]]) -> Bool {
        var rangesX = [(start: Int, end: Int)]()
        var rangesY = [(start: Int, end: Int)]()
        
        for rectangle in rectangles {
            rangesX.append((rectangle[0], rectangle[2]))
            rangesY.append((rectangle[1], rectangle[3]))
        }
        
        rangesX.sort { $0.start < $1.start }
        rangesY.sort { $0.start < $1.start }
        
        var count = (x: 0, y: 0)
        var farpoint = (x: rangesX[0].end, y: rangesY[0].end)
        
        for i in 1 ..< rangesX.endIndex {
            if farpoint.x <= rangesX[i].start {
                count.x += 1
            }
            
            if farpoint.y <= rangesY[i].start {
                count.y += 1
            }
            
            farpoint.x = max(farpoint.x, rangesX[i].end)
            farpoint.y = max(farpoint.y, rangesY[i].end)
        }
        
        return count.x >= 2 || count.y >= 2
    }
}
