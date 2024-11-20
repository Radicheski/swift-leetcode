//
//  TakeKOfEachCharacterFromLeftAndRight.swift
//  https://leetcode.com/problems/take-k-of-each-character-from-left-and-right/
//
//  Created by Erik Radicheski da Silva on 20/11/24.
//

import XCTest

final class TakeKOfEachCharacterFromLeftAndRight: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.takeCharacters("aabaaaacaabc", 2), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.takeCharacters("a", 1), -1)
    }
    
}

private class Solution {
    func takeCharacters(_ s: String, _ k: Int) -> Int {
        guard k > 0 else { return 0 }
        let s = Array(s)
        
        var count = Dictionary(s.map { ($0, 1) }, uniquingKeysWith: +)
        
        guard count.count == 3 && count.allSatisfy({ $0.value >= k }) else { return -1 }
        
        var left = 0
        var maxWindow = 0
        
        for right in s.indices {
            count[s[right], default: 0] -= 1
            
            while left <= right && count.values.allSatisfy({ $0 >= k }) == false {
                count[s[left], default: 0] += 1
                left += 1
            }
            
            maxWindow = max(maxWindow, right - left + 1)
        }
        
        return s.count - maxWindow
    }
}
