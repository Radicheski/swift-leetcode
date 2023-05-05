//
//  MaximumNumberOfVowelsInASubstringOfGivenLength.swift
//  https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/
//
//  Created by Erik Radicheski da Silva on 04/05/23.
//

import XCTest

final class MaximumNumberOfVowelsInASubstringOfGivenLength: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxVowels("abciiidef", 3), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxVowels("aeiou", 2), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxVowels("leetcode", 3), 2)
    }

}

private class Solution {
    
    private let vowels: Set<Character> = Set(["a", "e", "i", "o", "u"])
    
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        
        var maxCount = 0
        var countNumber = 0
        
        var start = -1
        var end = 0
        
        while start < s.count - k {
            if vowels.contains(s[end]) {
                countNumber += 1
            }
            
            if end - start >= k {
                if s.indices.contains(start) && vowels.contains(s[start]) {
                    countNumber -= 1
                }
                start += 1
            }
            
            maxCount = max(maxCount, countNumber)
        
            if end + 1 < s.endIndex {
                end += 1
            }
        }
        
        return maxCount
    }
}
