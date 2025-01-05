//
//  ShiftingLetters2.swift
//  https://leetcode.com/problems/shifting-letters-ii/
//
//  Created by Erik Radicheski da Silva on 05/01/25.
//

import XCTest

final class ShiftingLetters2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shiftingLetters("abc", [[0, 1,  0], [1, 2, 1], [0, 2, 1]]), "ace")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shiftingLetters("dztz",  [[0, 0, 0], [1, 1, 1]]), "catz")
    }
    
}

private class Solution {
    
    private let numToLetter = Array("abcdefghijklmnopqrstuvwxyz")
    private lazy var letterToNum = Dictionary(uniqueKeysWithValues: numToLetter.enumerated().map { ($0.element, $0.offset) })
    
    func shiftingLetters(_ s: String, _ shifts: [[Int]]) -> String {
        var letters = s.compactMap { letterToNum[$0] }
        let n = letters.count
        
        var difference = Array(repeating: 0, count: n)
        
        for shift in shifts {
            difference[shift[0]] += shift[2] == 0 ? -1 : 1
            
            guard shift[1] + 1 < n else { continue }
            
            difference[shift[1] + 1] += shift[2] == 0 ? 1 : -1
        }
        
        var numberOfShifts = 0
        for i in letters.indices {
            numberOfShifts += difference[i]
            numberOfShifts %= 26
            
            if numberOfShifts < 26 { numberOfShifts += 26 }
            
            letters[i] += numberOfShifts
            letters[i] %= 26
        }
        
        return String(letters.map { numToLetter[$0] })
    }
}
