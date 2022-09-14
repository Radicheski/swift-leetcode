//
//  ValidAnagram.swift
//  https://leetcode.com/problems/valid-anagram/
//
//  Created by Erik Radicheski da Silva on 05/09/22.
//

import XCTest

class ValidAnagram: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isAnagram("anagram", "nagaram"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.isAnagram("rat", "car"))
    }

}

private class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var sortedS = s.sorted()
        var sortedT = t.sorted()
        
        while let firstT = sortedT.first {
            if firstT == sortedS.first {
                let _ = sortedS.removeFirst()
                let _ = sortedT.removeFirst()
            } else {
                return false
            }
        }
        
        return true
    }
}
