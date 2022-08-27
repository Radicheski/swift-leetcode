//
//  FindAllAnagramsInAString.swift
//  https://leetcode.com/problems/find-all-anagrams-in-a-string/
//
//  Created by Erik Radicheski da Silva on 27/08/22.
//

import XCTest

class FindAllAnagramsInAString: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.findAnagrams("cbaebabacd", "abc"), [0, 6])
        XCTAssertEqual(solution.findAnagrams("abab", "ab"), [0, 1, 2])
    }

}

private class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.count < p.count { return [] }
        
        var result = [Int]()
        
        let pChars = getCharCount(p)
        let pSize = p.count
        
        var sChars = [Character: Int]()
        var removeQueue = [Character]()
        
        for (offset, char) in s.enumerated() {
            removeQueue.append(char)
            sChars[char, default: 0] += 1
            
            if offset >= pSize {
                let removeChar = removeQueue.removeFirst()
                if let count = sChars[removeChar] {
                    sChars[removeChar] = count - 1
                }
                
                if sChars[removeChar] == 0 { sChars[removeChar] = nil }
                
                if pChars == sChars { result.append(offset - pSize + 1) }
            } else if offset == pSize - 1 {
                if pChars == sChars { result.append(offset - pSize + 1) }
            }
        }
        
        return result
    }
    
    private func getCharCount<S: StringProtocol>(_ s: S) -> [Character: Int] {
        var result = [Character: Int]()
        
        for char in s {
            result[char, default: 0] += 1
        }
        
        return result
    }
}
