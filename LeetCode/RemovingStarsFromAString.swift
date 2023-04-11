//
//  RemovingStarsFromAString.swift
//  https://leetcode.com/problems/removing-stars-from-a-string/
//
//  Created by Erik Radicheski da Silva on 11/04/23.
//

import XCTest

final class RemovingStarsFromAString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.removeStars("leet**cod*e"), "lecoe")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.removeStars("erase*****"), "")
    }

}

private class Solution {
    func removeStars(_ s: String) -> String {
        var result = [Character]()
        
        for letter in s {
            if letter == "*" {
                let _ = result.removeLast()
            } else {
                result.append(letter)
            }
        }
                
        return String(result)
    }
}
