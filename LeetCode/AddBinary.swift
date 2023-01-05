//
//  AddBinary.swift
//  https://leetcode.com/problems/add-binary/
//
//  Created by Erik Radicheski da Silva on 05/01/23.
//

import XCTest

final class AddBinary: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.addBinary("11", "1"), "100")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.addBinary("1010", "1011"), "10101")
    }
    
}

private class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var a = Array(a)
        var b = Array(b)
        
        var result = [Character]()
        var carry: Character = "0"
        
        while a.isEmpty == false || b.isEmpty == false {
            let bitA = a.isEmpty ? "0" : a.removeLast()
            let bitB = b.isEmpty ? "0" : b.removeLast()
            
            if (bitA, bitB, carry) == ("1", "1", "1") {
                result.append("1")
            } else if (bitA, bitB, carry) == ("0", "0", "0") {
                result.append("0")
            } else if (bitA, bitB, carry) == ("1", "0", "0") ||
                        (bitA, bitB, carry) == ("0", "1", "0") ||
                        (bitA, bitB, carry) == ("0", "0", "1") {
                result.append("1")
                carry = "0"
            } else {
                result.append("0")
                carry = "1"
            }
        }
        
        if carry == "1" {
            result.append(carry)
        }
        
        return String(result.reversed())
    }
}
