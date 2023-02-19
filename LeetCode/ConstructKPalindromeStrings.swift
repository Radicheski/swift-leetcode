//
//  ConstructKPalindromeStrings.swift
//  https://leetcode.com/problems/construct-k-palindrome-strings/
//
//  Created by Erik Radicheski da Silva on 19/02/23.
//

import XCTest

final class ConstructKPalindromeStrings: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canConstruct("annabelle", 2))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canConstruct("leetcode", 3))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.canConstruct("true", 4))
    }

}

private class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        guard s.count > k else { return s.count == k }
        
        let characterFrequency = Dictionary(s.map { ($0, 1) }, uniquingKeysWith: +)
        
        let oddCount = characterFrequency.values.filter( { $0.isMultiple(of: 2) == false } ).count
        
        return oddCount <= k
    }
}
