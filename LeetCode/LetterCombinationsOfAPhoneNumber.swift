//
//  LetterCombinationsOfAPhoneNumber.swift
//  https://leetcode.com/problems/letter-combinations-of-a-phone-number/
//
//  Created by Erik Radicheski da Silva on 29/10/22.
//

import XCTest

final class LetterCombinationsOfAPhoneNumber: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let output = solution.letterCombinations("23")
        let expectedOutput = ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
        XCTAssertEqual(output.count, expectedOutput.count)
        XCTAssertEqual(Set(output), Set(expectedOutput))
    }
    
    func testExampleB() {
        let output = solution.letterCombinations("")
        let expectedOutput = [String]()
        XCTAssertEqual(output.count, expectedOutput.count)
        XCTAssertEqual(Set(output), Set(expectedOutput))
    }
    
    func testExampleC() {
        let output = solution.letterCombinations("2")
        let expectedOutput = ["a", "b", "c"]
        XCTAssertEqual(output.count, expectedOutput.count)
        XCTAssertEqual(Set(output), Set(expectedOutput))
    }

}

private class Solution {
    
    private let digits: [Character: [String]] = ["2": ["a", "b", "c"],
                          "3": ["d", "e", "f"],
                          "4": ["g", "h", "i"],
                          "5": ["j", "k", "l"],
                          "6": ["m", "n", "o"],
                          "7": ["p", "q", "r", "s"],
                          "8": ["t", "u", "v"],
                          "9": ["w", "x", "y", "z"]]
    
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.isEmpty == false else { return [] }
        
        var digits = Array(digits)
        let first = digits.removeFirst()
        
        if digits.isEmpty { return self.digits[first] ?? [] }
        
        var result = [String]()
        
        for case let letter in self.digits[first]! {
            for string in letterCombinations(String(digits)) {
                result.append(letter.appending(string))
            }
        }
        
        return result
    }
    
}
