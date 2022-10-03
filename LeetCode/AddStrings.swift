//
//  AddStrings.swift
//  https://leetcode.com/problems/add-strings/
//
//  Created by Erik Radicheski da Silva on 03/10/22.
//

import XCTest

final class AddStrings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.addStrings("11", "123"), "134")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.addStrings("456", "77"), "533")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.addStrings("0", "0"), "0")
    }

}

private class Solution {
    
    func addStrings(_ num1: String, _ num2: String) -> String {
        guard num1.isEmpty == false else { return num2 }
        guard num2.isEmpty == false else { return num1 }
        
        let length = max(num1.count, num2.count)
        
        var num1 = String(num1.reversed())
        var num2 = String(num2.reversed())
        
        while num1.count < length {
            num1.append("0")
        }
        
        while num2.count < length {
            num2.append("0")
        }
        
        var carry: Character = "0"
        var result = ""
        
        for _ in 0 ..< length {
            let digit1 = num1.removeFirst()
            let digit2 = num2.removeFirst()
            
            let answer = addStrings(digit1, digit2, carry)
            carry = answer.carry
            result.append(answer.sum)
        }
        
        result.append(carry)
        
        while result.hasSuffix("0") {
            result.removeLast()
        }
        
        return result.isEmpty ? "0" : String(result.reversed())
    }
    
    func addStrings(_ num1: Character, _ num2: Character, _ carry: Character) -> (sum: String, carry: Character) {
        guard let num1 = num1.asciiValue else { return ("0", "0") }
        guard let num2 = num2.asciiValue else { return ("0", "0") }
        guard var carry = carry.asciiValue else { return ("0", "0") }
        
        var sum = "\(num1 + num2 + carry - 144)"
        carry = sum.count == 1 ? 48 : sum.removeFirst().asciiValue!
        
        return (sum, Character(Unicode.Scalar(carry)))
    }
    
}
