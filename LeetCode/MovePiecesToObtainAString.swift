//
//  MovePiecesToObtainAString.swift
//  https://leetcode.com/problems/move-pieces-to-obtain-a-string/
//
//  Created by Erik Radicheski da Silva on 05/12/24.
//

import XCTest

final class MovePiecesToObtainAString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canChange("_L__R__R_", "L______RR"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canChange("R_L_", "__LR"))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.canChange("_R", "R_"))
    }
    
}

private class Solution {
    func canChange(_ start: String, _ target: String) -> Bool {
        var startQueue = start.enumerated().reversed().filter { $0.element != "_" }
        var targetQueue = target.enumerated().reversed().filter { $0.element != "_" }
        
        guard startQueue.count == targetQueue.count else { return false }
        
        while let (si, s) = startQueue.popLast(),
              let (ti, t) = targetQueue.popLast() {
            
            guard s == t else { return false }
            
            if s == "L" && si < ti { return false }
            if t == "R" && si > ti { return false }
        }
        
        return true
    }
}
