//
//  UsingARobotToPrintTheLexicographicallySmallestString.swift
//  https://leetcode.com/problems/using-a-robot-to-print-the-lexicographically-smallest-string/
//
//  Created by Erik Radicheski da Silva on 06/06/25.
//

import XCTest

final class UsingARobotToPrintTheLexicographicallySmallestString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.robotWithString("zza"), "azz")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.robotWithString("bac"), "abc")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.robotWithString("bdda"), "addb")
    }
    
}

private class Solution {
    func robotWithString(_ s: String) -> String {
        var count = Dictionary(s.map( { ($0, 1) } ), uniquingKeysWith: +)
        var stack = [Character]()
        var answer = [Character]()
        
        var minCharacter: Character = "a"
        
        for c in s {
            stack.append(c)
            count[c, default: 0] -= 1
            
            while minCharacter != "z" && count[minCharacter, default: 0] == 0 {
                let ascii = minCharacter.asciiValue!
                minCharacter = Character(UnicodeScalar(ascii + 1))
            }
            
            while stack.isEmpty == false && stack.last! <= minCharacter {
                answer.append(stack.removeLast())
            }
        }
        
        return String(answer)
    }
}
