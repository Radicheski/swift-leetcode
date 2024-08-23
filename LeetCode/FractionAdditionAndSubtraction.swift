//
//  FractionAdditionAndSubtraction.swift
//  https://leetcode.com/problems/fraction-addition-and-subtraction/
//
//  Created by Erik Radicheski da Silva on 23/08/24.
//

import XCTest

final class FractionAdditionAndSubtraction: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.fractionAddition("-1/2+1/2"), "0/1")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.fractionAddition("-1/2+1/2+1/3"), "1/3")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.fractionAddition("1/3-1/2"), "-1/6")
    }
    
}

private class Solution {
    func fractionAddition(_ expression: String) -> String {
        let expression = Array(expression)
        var indices = [0]
        
        for (i, c) in expression.enumerated().dropFirst() {
            if c == "-" || c == "+" {
                indices.append(i)
            }
        }
        indices.append(expression.endIndex)
        
        var terms = [(numerator: Int, denominator: Int)]()
        
        for i in 1 ..< indices.endIndex {
            let (start, end) = (indices[i - 1], indices[i])
            
            var digits = [[Character]()]
            var index = 0
            
            for j in start ..< end {
                if expression[j] == "/" {
                    digits.append([])
                    index += 1
                    continue
                }
                
                digits[index].append(expression[j])
            }
            
            let array = digits.map { String($0) }.compactMap(Int.init)
            
            terms.append((array[0], array[1]))
        }
        
        var numerator = 0
        var commonDenominator = 1
        
        for term in terms {
            commonDenominator *= term.denominator
        }
        
        for term in terms {
            numerator += (term.numerator * commonDenominator) / term.denominator
        }
        
        let gcd = abs(gcd(numerator, commonDenominator))
        numerator /= gcd
        commonDenominator /= gcd

        return "\(numerator)/\(commonDenominator)"
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        guard a != 0 else { return b }
        return gcd(b % a, a)
    }
}
