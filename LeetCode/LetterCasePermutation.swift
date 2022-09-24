//
//  LetterCasePermutation.swift
//  https://leetcode.com/problems/letter-case-permutation/
//
//  Created by Erik Radicheski da Silva on 24/09/22.
//

import XCTest

final class LetterCasePermutation: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(Set(solution.letterCasePermutation("a1b2")), Set(["a1b2", "a1B2", "A1b2", "A1B2"]))
        XCTAssertEqual(solution.letterCasePermutation("a1b2").count, ["a1b2", "a1B2", "A1b2", "A1B2"].count)
    }
    
    func testExampleB() {
        XCTAssertEqual(Set(solution.letterCasePermutation("3z4")), Set(["3z4", "3Z4"]))
        XCTAssertEqual(solution.letterCasePermutation("3z4").count, ["3z4", "3Z4"].count)
    }
    
    func testExample() {
        XCTAssertEqual(Set(solution.letterCasePermutation("C")), Set(["c", "C"]))
        XCTAssertEqual(solution.letterCasePermutation("C").count, ["c", "C"].count)
    }
    

}

private class Solution {
    func letterCasePermutation(_ s: String) -> [String] {
        guard s.isEmpty == false else { return [] }
        
        if s.rangeOfCharacter(from: CharacterSet.letters, options: .caseInsensitive) == nil {
            return [s]
        }
        
        if let firstLetter = s.first {
            let substring = String(s.dropFirst())
            
            let substringPermutations = letterCasePermutation(substring)
            if substringPermutations.isEmpty {
                return [firstLetter.uppercased(), firstLetter.lowercased()]
            } else {
                return Array(substringPermutations.reduce(into: Set<String>()) {
                    let letter = String(s.first!)
                    $0.insert("\(letter.lowercased())\($1)")
                    $0.insert("\(letter.uppercased())\($1)")
                })
            }
        } else {
            return []
        }
    }
}
