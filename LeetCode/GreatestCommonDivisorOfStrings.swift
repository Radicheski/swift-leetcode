//
//  GreatestCommonDivisorOfStrings.swift
//  https://leetcode.com/problems/greatest-common-divisor-of-strings/
//
//  Created by Erik Radicheski da Silva on 01/02/23.
//

import XCTest

final class GreatestCommonDivisorOfStrings: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.gcdOfStrings("ABCABC", "ABC"), "ABC")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.gcdOfStrings("ABABAB", "ABAB"), "AB")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.gcdOfStrings("LEET", "CODE"), "")
    }
    
}

private class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard str1 != str2 else { return str1 }
        
        let smallerString = str1.endIndex <= str2.endIndex ? Array(str1) : Array(str2)
        let biggerString = str1.endIndex > str2.endIndex ? Array(str1) : Array(str2)
        
    outer: for i in smallerString.indices.reversed() {
            guard smallerString.count.isMultiple(of: i + 1) else { continue }
            guard biggerString.count.isMultiple(of: i + 1) else { continue }
            
            let divisor = smallerString[...i]
            
            for j in 0 ..< smallerString.count / divisor.count {
                let startIndex = j * divisor.count
                let endIndex = (j + 1) * divisor.count
                guard divisor == smallerString[startIndex ..< endIndex] else { continue outer }
            }
            
            for j in 0 ..< biggerString.count / divisor.count {
                let startIndex = j * divisor.count
                let endIndex = (j + 1) * divisor.count
                guard divisor == biggerString[startIndex ..< endIndex] else { continue outer }
            }
        
            return String(divisor)
            
        }
        
        return ""
    }
}
