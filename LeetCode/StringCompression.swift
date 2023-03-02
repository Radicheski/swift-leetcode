//
//  StringCompression.swift
//  https://leetcode.com/problems/string-compression/
//
//  Created by Erik Radicheski da Silva on 02/03/23.
//

import XCTest

final class StringCompression: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        var input: [Character] = ["a", "a", "b", "b", "c", "c", "c"]
        XCTAssertEqual(solution.compress(&input), 6)
        XCTAssertEqual(input, ["a", "2", "b", "2", "c", "3"])
    }
    
    func testExampleB() {
        var input: [Character] = ["a"]
        XCTAssertEqual(solution.compress(&input), 1)
        XCTAssertEqual(input, ["a"])
    }
    
    func testExampleC() {
        var input: [Character] = ["a", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b"]
        XCTAssertEqual(solution.compress(&input), 4)
        XCTAssertEqual(input, ["a", "b", "1", "2"])
    }

}

private class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var index = 0
        
        while index < chars.endIndex {
            let character = chars[index]
            
            var endIndex = index + 1
            
            while endIndex < chars.endIndex && chars[endIndex] == character {
                endIndex += 1
            }
            
            chars.removeSubrange(index + 1 ..< endIndex)
            
            if endIndex - index > 1 {
                let countString = Array("\(endIndex - index)")
                chars.insert(contentsOf: countString, at: index + 1)
                index += countString.count
            }
            
            index += 1
        }
        
        return chars.count
    }
}
