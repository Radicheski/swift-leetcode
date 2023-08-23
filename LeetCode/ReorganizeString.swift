//
//  ReorganizeString.swift
//  https://leetcode.com/problems/reorganize-string/
//
//  Created by Erik Radicheski da Silva on 23/08/23.
//

import XCTest

final class ReorganizeString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.reorganizeString("aab"), "aba")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.reorganizeString("aaab"), "")
    }
    
}

private class Solution {
    func reorganizeString(_ s: String) -> String {
        var string = Array(s)
        
        guard string.count > 1 else { return s }
        
        let charactersCount = Dictionary(string.map { ($0, 1) }, uniquingKeysWith: +)
        
        guard charactersCount.values.max()! <= (string.count + 1) / 2 else { return "" }
        
        var characters = charactersCount
            .sorted { $0.value > $1.value }
            .flatMap { Array(repeating: $0.key, count: $0.value) }
        
        var index = 0
        
        while characters.isEmpty == false {
            string[index] = characters.removeFirst()
            
            index += 2
            
            if index >= string.endIndex { index = 1 }
        }
        
        return String(string)
    }
}
