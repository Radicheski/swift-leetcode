//
//  MinimizeXOR.swift
//  https://leetcode.com/problems/minimize-xor/
//
//  Created by Erik Radicheski da Silva on 15/01/25.
//

import XCTest

final class MinimizeXOR: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimizeXor(3, 5), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimizeXor(1, 12), 3)
    }
    
}

private class Solution {
    func minimizeXor(_ num1: Int, _ num2: Int) -> Int {
        var bits = num2.nonzeroBitCount
        var answer = 0
        
        for i in (0 ..< num1.bitWidth).reversed() {
            guard bits > 0 else { break }
            
            if num1 & (1 << i) > 0 {
                answer |= 1 << i
                bits -= 1
            }
        }
        
        for i in 0 ..< num1.bitWidth {
            guard bits > 0 else { break }
            
            if answer & (1 << i) == 0 {
                answer |= 1 << i
                bits -= 1
            }
        }
        
        return answer
    }
}
