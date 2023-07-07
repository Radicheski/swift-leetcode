//
//  MaximizeTheConfusionOfAnExam.swift
//  https://leetcode.com/problems/maximize-the-confusion-of-an-exam/
//
//  Created by Erik Radicheski da Silva on 07/07/23.
//

import XCTest

final class MaximizeTheConfusionOfAnExam: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxConsecutiveAnswers("TTFF", 2), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxConsecutiveAnswers("TFFT", 1), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxConsecutiveAnswers("TTFTTFTT", 1), 5)
    }
    
}

private class Solution {
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        let answerKey = Array(answerKey)
        var left = k
        var right = answerKey.count
        
        while left < right {
            let middle = left + (right - left) / 2 + 1
            
            if isValid(answerKey, middle, k) {
                left = middle
            } else {
                right = middle - 1
            }
        }
        
        return left
    }
    
    private func isValid(_ answerKey: [Character], _ size: Int, _ k: Int) -> Bool {
        let n = answerKey.count
        var counter = [Character: Int]()
        
        var c: Character
        
        for i in 0 ..< size {
            c = answerKey[i]
            counter[c, default: 0] += 1
        }
        
        if min(counter["T", default: 0], counter["F", default: 0]) <= k {
            return true
        }
        
        for i in size ..< n {
            c = answerKey[i]
            counter[c, default: 0] += 1
            
            if answerKey.indices.contains(i - size) {
                c = answerKey[i - size]
                counter[c, default: 0] -= 1
            }
            
            if min(counter["T", default: 0], counter["F", default: 0]) <= k {
                return true
            }
        }
        
        return false
    }
}
