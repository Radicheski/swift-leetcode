//
//  FindThePunishmentNumberOfAnInteger.swift
//  https://leetcode.com/problems/find-the-punishment-number-of-an-integer/
//
//  Created by Erik Radicheski da Silva on 15/02/25.
//

import XCTest

final class FindThePunishmentNumberOfAnInteger: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.punishmentNumber(10), 182)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.punishmentNumber(37), 1478)
    }
    
}

private class Solution {
    func punishmentNumber(_ n: Int) -> Int {
        var sum = 0
        
        for i in 1 ... n {
            let square = Array("\(i * i)")
            
            guard isPunishementNumber(square, i) else { continue }
            
            sum += i * i
        }
        
        return sum
    }
    
    private func isPunishementNumber(_ square: [Character], _ num: Int) -> Bool {
        if square.isEmpty { return num == 0 }
        
        for i in 0 ..< square.endIndex {
            let current = Int(String(square.prefix(upTo: i + 1)))!
            
            if isPunishementNumber(Array(square.suffix(from: i + 1)), num - current) {
                return true
            }
        }
        
        return false
    }
}
