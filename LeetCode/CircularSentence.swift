//
//  CircularSentence.swift
//  https://leetcode.com/problems/circular-sentence/
//
//  Created by Erik Radicheski da Silva on 01/11/24.
//

import XCTest

final class CircularSentence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isCircularSentence("leetcode exercises sound delightful"))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.isCircularSentence("eetcode"))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.isCircularSentence("Leetcode is cool"))
    }
    
}

private class Solution {
    func isCircularSentence(_ sentence: String) -> Bool {
        var sentence = sentence.components(separatedBy: .whitespaces)
        sentence.append(sentence[0])
        
        for i in 1 ..< sentence.endIndex {
            guard sentence[i - 1].last == sentence[i].first else { return false }
        }
        
        return true
    }
}
