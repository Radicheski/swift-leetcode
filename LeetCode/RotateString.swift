//
//  RotateString.swift
//  https://leetcode.com/problems/rotate-string/
//
//  Created by Erik Radicheski da Silva on 03/11/24.
//

import XCTest

final class RotateString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.rotateString("abcde", "cdeab"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.rotateString("abcde", "abced"))
    }
    
}

private class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        let goal = Array(goal)
        var s = Array(s)
        
        guard s.count == goal.count else { return false }
        
        let maxShift = s.count
        
        for _ in 0 ..< maxShift {
            if s == goal { return true }
            
            let shift = s.removeFirst()
            s.append(shift)
        }
        
        return false
    }
}
