//
//  CustomSortString.swift
//  https://leetcode.com/problems/custom-sort-string/
//
//  Created by Erik Radicheski da Silva on 12/03/24.
//

import XCTest

final class CustomSortString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.customSortString("cba", "abcd"), "cbad")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.customSortString("bcafg", "abcd"), "bcad")
    }

}

private class Solution {
    func customSortString(_ order: String, _ s: String) -> String {
        var characters = [Character: Int]()
        
        for character in s {
            characters[character, default: 0] += 1
        }
        
        var answer = [Character]()
        
        for character in order {
            guard let count = characters[character] else { continue }
            
            let string = Array(repeating: character, count: count)
            answer.append(contentsOf: string)
            
            characters[character] = nil
        }
        
        for (character, count) in characters {
            let string = Array(repeating: character, count: count)
            answer.append(contentsOf: string)
        }
        
        return String(answer)
    }
}
