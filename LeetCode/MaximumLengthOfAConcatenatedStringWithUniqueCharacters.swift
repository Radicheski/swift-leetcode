//
//  MaximumLengthOfAConcatenatedStringWithUniqueCharacters.swift
//  https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/
//
//  Created by Erik Radicheski da Silva on 23/01/24.
//

import XCTest

final class MaximumLengthOfAConcatenatedStringWithUniqueCharacters: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxLength(["un", "iq", "ue"]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxLength(["cha", "r", "act", "ers"]), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxLength(["abcdefghijklmnopqrstuvwxyz"]), 26)
    }
    
}

private class Solution {
    func maxLength(_ arr: [String]) -> Int {
        let arr = arr.map(bitMask).filter { $0 > 0 }
        
        var answer = 0
        var memo = Set<Int>()
        
        for element in arr.reversed() {
            var newMemo = Set([element])
            
            for otherElement in memo where element & otherElement == 0 {
                let newElement = element | otherElement
                newMemo.insert(newElement)
                answer = max(answer, newElement.nonzeroBitCount)
            }
            
            answer = max(answer, element.nonzeroBitCount)
            memo.formUnion(newMemo)
        }
        
        return answer
    }
    
    private func bitMask(_ string: String) -> Int {
        let bits = string.compactMap(\.asciiValue)
            .map(Int.init)
            .map { $0 - 97 }
            .map { 1 << $0 }
        
        guard Set(bits).count == bits.count else { return 0 }
        
        return bits.reduce(into: 0, |=)
    }
}
