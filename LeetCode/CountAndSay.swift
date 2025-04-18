//
//  CountAndSay.swift
//  https://leetcode.com/problems/count-and-say/
//
//  Created by Erik Radicheski da Silva on 18/04/25.
//

import XCTest

final class CountAndSay: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countAndSay(4), "1211")
    }
    
    func test() {
        XCTAssertEqual(solution.countAndSay(2), "11")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countAndSay(1), "1")
    }
    
}

private class Solution {
    func countAndSay(_ n: Int) -> String {
        guard n > 1 else { return "1" }
        
        var result = ""
        var lastCharacter: Character?
        var lastCount = 0
        
        for character in Array(countAndSay(n - 1)) {
            if character == lastCharacter {
                lastCount += 1
                continue
            }
            
            if let lastCharacter = lastCharacter {
                result.append("\(lastCount)")
                result.append(lastCharacter)
            }
            
            lastCharacter = character
            lastCount = 1
        }
        
        if let lastCharacter = lastCharacter {
            result.append("\(lastCount)")
            result.append(lastCharacter)
        }
        
        return result
    }
}
