//
//  FindKthBitInNthBinaryString.swift
//  https://leetcode.com/problems/find-kth-bit-in-nth-binary-string/
//
//  Created by Erik Radicheski da Silva on 18/10/24.
//

import XCTest

final class FindKthBitInNthBinaryString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findKthBit(3, 1), "0")
    }
    
    func testExmapleB() {
        XCTAssertEqual(solution.findKthBit(4, 11), "1")
    }
    
}

private class Solution {
    func findKthBit(_ n: Int, _ k: Int) -> Character {
        guard n > 1 else { return "0" }
        var s = [0]
        
        for _ in 2 ... n {
            s = s + [1] + s.map { 1 - $0 }.reversed()
        }
        
        return "\(s[k - 1])".first!
    }
}
