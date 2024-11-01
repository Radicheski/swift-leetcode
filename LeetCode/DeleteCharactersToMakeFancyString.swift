//
//  DeleteCharactersToMakeFancyString.swift
//  https://leetcode.com/problems/delete-characters-to-make-fancy-string/
//
//  Created by Erik Radicheski da Silva on 01/11/24.
//

import XCTest

final class DeleteCharactersToMakeFancyString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.makeFancyString("leeetcode"), "leetcode")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.makeFancyString("aaabaaaa"), "aabaa")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.makeFancyString("aab"), "aab")
    }
    
}

private class Solution {
    func makeFancyString(_ s: String) -> String {
        guard s.count > 2 else { return s }
        
        var stack = [Character]()
        
        for (i, c) in s.enumerated() {

            if i > 1 {
                let j = stack.endIndex
                if stack[j - 2] == c && stack[j - 1] == c { continue }
            }
            stack.append(c)
        }
        
        return String(stack)
    }
}
