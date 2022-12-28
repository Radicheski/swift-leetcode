//
//  ToLowerCase.swift
//  https://leetcode.com/problems/to-lower-case/
//
//  Created by Erik Radicheski da Silva on 28/12/22.
//

import XCTest

final class ToLowerCase: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.toLowerCase("Hello"), "hello")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.toLowerCase("here"), "here")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.toLowerCase("LOVELY"), "lovely")
    }

}

private class Solution {
    func toLowerCase(_ s: String) -> String {
        var string = Array(s)
        
        let uppercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let lowercase = Array("abcdefghijklmnopqrstuvwxyz")
        
        for (index, character) in string.enumerated() {
            if let caseIndex = uppercase.firstIndex(of: character) {
                string[index] = lowercase[caseIndex]
            }
        }
        
        return String(string)
    }
}
