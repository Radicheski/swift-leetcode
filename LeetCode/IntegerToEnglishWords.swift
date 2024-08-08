//
//  IntegerToEnglishWords.swift
//  https://leetcode.com/problems/integer-to-english-words/
//
//  Created by Erik Radicheski da Silva on 07/08/24.
//

import XCTest

final class IntegerToEnglishWords: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberToWords(123), "One Hundred Twenty Three")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberToWords(12345), "Twelve Thousand Three Hundred Forty Five")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numberToWords(1234567), "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven")
    }
    
}

    private class Solution {
        
        private let ones = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
                            "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
        private let tens = ["Zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
        private let powers = ["", "Thousand", "Million", "Billion"]
        
        func numberToWords(_ num: Int) -> String {
            guard num > 0 else { return ones[num] }
            
            var answer = [String]()
            
            var num = num
            var tenPower = 0
            
            while num > 0 {
                if num.isMultiple(of: 1000) == false {
                    var partString = [String]()
                    
                    var part = num % 1000
                    
                    if part >= 100 {
                        partString += [ones[part / 100], "Hundred"]
                        part %= 100
                    }
                    
                    if part >= 20 {
                        partString += [tens[part / 10]]
                        part %= 10
                    }
                    
                    if part > 0 {
                        partString += [ones[part]]
                    }
                    
                    if tenPower > 0 {
                        partString += [powers[tenPower]]
                    }
                    answer.insert(contentsOf: partString, at: 0)
                }
                
                num /= 1000
                tenPower += 1
            }
            
            return answer.joined(separator: " ")
        }
    }
