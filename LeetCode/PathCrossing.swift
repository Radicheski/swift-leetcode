//
//  PathCrossing.swift
//  https://leetcode.com/problems/path-crossing/
//
//  Created by Erik Radicheski da Silva on 23/12/23.
//

import XCTest

final class PathCrossing: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertFalse(solution.isPathCrossing("NES"))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.isPathCrossing("NESWW"))
    }
    
}

private class Solution {
    func isPathCrossing(_ path: String) -> Bool {
        var (x, y) = (0, 0)
        var points = [0: Set([0])]
        
        for direction in path {
            switch direction {
            case "N": y += 1
            case "S": y -= 1
            case "E": x += 1
            case "W": x -= 1
            default: fatalError()
            }
            
            if points[x] == nil {
                points[x] = Set([y])
            } else if let set = points[x] {
                guard set.contains(y) == false else { return true }
                points[x]?.insert(y)
            }
        }
        
        return false
    }
}
