//
//  SortVowelsInAString.swift
//  https://leetcode.com/problems/sort-vowels-in-a-string/
//
//  Created by Erik Radicheski da Silva on 13/11/23.
//

import XCTest

final class SortVowelsInAString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sortVowels("lEetcOde"), "lEOtcede")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sortVowels("lYmpH"), "lYmpH")
    }

}

private class Solution {
    func sortVowels(_ s: String) -> String {
        var answer = Array(s)
        
        var vowels = [Character]()
        var indices = [Int]()
        
        for (index, char) in answer.enumerated() where "AEIOUaeiou".contains(char){
            indices.append(index)
            vowels.append(char)
        }
        
        vowels.sort { $0.asciiValue! < $1.asciiValue! }
        
        for i in vowels.indices {
            answer[indices[i]] = vowels[i]
        }
        
        return String(answer)
    }
}
