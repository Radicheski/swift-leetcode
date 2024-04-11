//
//  RemoveKDigits.swift
//  https://leetcode.com/problems/remove-k-digits/
//
//  Created by Erik Radicheski da Silva on 11/04/24.
//

import XCTest

final class RemoveKDigits: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.removeKdigits("1432219", 3), "1219")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.removeKdigits("10200", 1), "200")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.removeKdigits("10", 2),  "0")
    }
    
}

private class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        guard num.count > k else { return "0" }
        
        var k = k
        
        var answer = [Character]()
        
        for char in num {
            while answer.isEmpty == false
                    && k > 0
                    && answer.last! > char {
                let _ = answer.removeLast()
                k -= 1
            }
            
            answer.append(char)
        }
        
        answer.removeLast(k)
        
        while answer.first == "0" {
            let _ = answer.removeFirst()
        }
        
        return answer.isEmpty ? "0" : String(answer)
    }
}
