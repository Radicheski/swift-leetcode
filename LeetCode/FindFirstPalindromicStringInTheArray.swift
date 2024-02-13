//
//  FindFirstPalindromicStringInTheArray.swift
//  https://leetcode.com/problems/find-first-palindromic-string-in-the-array/
//
//  Created by Erik Radicheski da Silva on 13/02/24.
//

import XCTest

final class FindFirstPalindromicStringInTheArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.firstPalindrome(["abc", "car", "ada", "racecar", "cool"]), "ada")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.firstPalindrome(["notapalindrome", "racecar"]), "racecar")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.firstPalindrome(["def", "ghi"]), "")
    }

}

private class Solution {
    func firstPalindrome(_ words: [String]) -> String {
        for word in words {
            if isPalindrome(word) { return word }
        }
        
        return ""
    }
    
    private func isPalindrome(_ word: String) -> Bool {
        let word = Array(word)
        
        var start = 0
        var end = word.endIndex - 1
        
        while start < end {
            guard word[start] == word[end] else { return false }
            
            start += 1
            end -= 1
        }
        
        return true
    }
}
