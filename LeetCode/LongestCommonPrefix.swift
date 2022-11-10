//
//  LongestCommonPrefix.swift
//  https://leetcode.com/problems/longest-common-prefix/
//
//  Created by Erik Radicheski da Silva on 10/11/22.
//

import XCTest

final class LongestCommonPrefix: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestCommonPrefix(["flower", "flow", "flight"]), "fl")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestCommonPrefix(["dog", "racecar", "car"]), "")
    }

}

private class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var strings = strs.map(Array.init)
        
        var result = [Character]()
        
        while strings.allSatisfy( { $0.isEmpty == false } ) {
            var first = Set<Character>()
            
            for i in 0 ..< strings.endIndex {
                first.insert(strings[i].removeFirst())
            }
            
            if first.count == 1 {
                result.append(contentsOf: first)
            } else {
                break
            }
        }
        
        return String(result)
    }
}
