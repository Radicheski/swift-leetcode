//
//  AddingSpacesToAString.swift
//  https://leetcode.com/problems/adding-spaces-to-a-string/
//
//  Created by Erik Radicheski da Silva on 03/12/24.
//

import XCTest

final class AddingSpacesToAString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.addSpaces("LeetcodeHelpsMeLearn", [8, 13, 15]), "Leetcode Helps Me Learn")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.addSpaces("icodeinpython", [1, 5, 7, 9]), "i code in py thon")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.addSpaces("spacing", [0,1,2,3,4,5,6]), " s p a c i n g")
    }
    
}

private class Solution {
    func addSpaces(_ s: String, _ spaces: [Int]) -> String {
        let s = Array(s)
        var answer = [Character]()
        
        var index = 0
        
        for space in spaces {
            while index < space {
                answer.append(s[index])
                index += 1
            }
            
            answer.append(" ")
        }
        
        answer.append(contentsOf: s[index...])
        
        return String(answer)
    }
}
