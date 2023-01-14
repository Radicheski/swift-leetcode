//
//  LexicographicallySmallestEquivalentString.swift
//  https://leetcode.com/problems/lexicographically-smallest-equivalent-string/
//
//  Created by Erik Radicheski da Silva on 14/01/23.
//

import XCTest

final class LexicographicallySmallestEquivalentString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.smallestEquivalentString("parker", "morris", "parser"), "makkek")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.smallestEquivalentString("hello", "world", "hold"), "hdld")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.smallestEquivalentString("leetcode", "programs", "sourcecode"), "aauaaaaada")
    }

}

private class Solution {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        let s1 = Array(s1)
        let s2 = Array(s2)
        let baseStr = Array(baseStr)
        var result = [Character]()
        
        var equivalency = [Set<Character>]()
        
        for i in 0 ..< s1.endIndex {
            let newSet = Set([s1[i], s2[i]])
            
            if let index = equivalency.firstIndex(where: { $0.isDisjoint(with: newSet) == false }) {
                equivalency[index].formUnion(newSet)
            } else {
                equivalency.append(newSet)
            }
            
        }
        
        var index = 0
        
        while index < equivalency.endIndex {
            if let i = equivalency[(index + 1)...].firstIndex(where: { $0.isDisjoint(with: equivalency[index]) == false }) {
                let set = equivalency.remove(at: i)
                equivalency[index].formUnion(set)
            } else {
                index += 1
            }
        }
        
        for char in baseStr {
            if let set = equivalency.first(where: { $0.contains(char) }),
               let newChar = set.min() {
                result.append(newChar)
            } else {
                result.append(char)
            }
        }
        
        return String(result)
    }
}
