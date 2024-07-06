//
//  PassThePillow.swift
//  https://leetcode.com/problems/pass-the-pillow/
//
//  Created by Erik Radicheski da Silva on 06/07/24.
//

import XCTest

final class PassThePillow: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.passThePillow(4, 5), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.passThePillow(3, 2), 3)
    }
    
}

private class Solution {
    func passThePillow(_ n: Int, _ time: Int) -> Int {
        var time = time
        var person = 1
        var direction = 1
        
        while time > 0 {
            if person == 1 { direction =  1 }
            if person == n { direction = -1 }
            
            person += direction
            time -= 1
        }
        
        return person
    }
}
