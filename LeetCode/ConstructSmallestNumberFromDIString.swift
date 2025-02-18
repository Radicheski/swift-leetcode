//
//  ConstructSmallestNumberFromDIString.swift
//  https://leetcode.com/problems/construct-smallest-number-from-di-string/
//
//  Created by Erik Radicheski da Silva on 18/02/25.
//

import XCTest

final class ConstructSmallestNumberFromDIString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.smallestNumber("IIIDIDDD"), "123549876")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.smallestNumber("DDD"), "4321")
    }
    
}

private class Solution {
    func smallestNumber(_ pattern: String) -> String {
        let pattern = Array(pattern)
        var availableNums = Array(repeating: true, count: 10)
        
        return String(formString(0, -1, pattern, &availableNums))
    }
    
    private func formString(_ number: Int, _ position: Int, _ pattern: [Character], _ availableNums: inout [Bool]) -> Int {
        guard position < pattern.count else { return number }
        
        let increment = position == -1 || pattern[position] == "I"
        let last = number % 10
        
        var answer = Int.max
        
        for i in 1 ... 9 where availableNums[i] {
            guard availableNums[i] else { continue }
            
            if (last < i) == increment {
                availableNums[i] = false
                
                answer = min(answer, formString(number * 10 + i, position + 1, pattern, &availableNums))
                
                availableNums[i] = true
            }
        }
        
        return answer
    }
}
