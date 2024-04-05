//
//  MakeTheStringGreat.swift
//  https://leetcode.com/problems/make-the-string-great
//
//  Created by Erik Radicheski da Silva on 05/04/24.
//

import XCTest

final class MakeTheStringGreat: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.makeGood("leEeetcode"), "leetcode")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.makeGood("abBAcC"), "")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.makeGood("s"), "s")
    }
    
}

private class Solution {
    func makeGood(_ s: String) -> String {
        var answer = [Character]()
        
        for char in s {
            guard answer.isEmpty == false else {
                answer.append(char)
                continue
            }
            
            if answer.last?.lowercased() == char.lowercased() && answer.last?.isUppercase == char.isLowercase {
                let _ = answer.removeLast()
            } else {
                answer.append(char)
            }
        }
        
        return String(answer)
    }
}
