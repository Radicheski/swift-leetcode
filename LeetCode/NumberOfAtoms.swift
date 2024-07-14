//
//  NumberOfAtoms.swift
//  https://leetcode.com/problems/number-of-atoms/
//
//  Created by Erik Radicheski da Silva on 14/07/24.
//

import XCTest

final class NumberOfAtoms: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countOfAtoms("H2O"), "H2O")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countOfAtoms("Mg(OH)2"), "H2MgO2")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countOfAtoms("K4(ON(SO3)2)2"), "K4N2O14S4")
    }
    
}

private class Solution {
    func countOfAtoms(_ formula: String) -> String {
        let formula = Array(formula)
        var stack = [[String: Int]()]
        var index = 0
        
        while index < formula.endIndex {
            let letter = formula[index]
            
            if letter == "(" {
                stack.append([:])
                index += 1
            } else if letter == ")" {
                var map = stack.popLast()!
                index += 1
                var multiplier = [Character]()
                
                while index < formula.endIndex && formula[index].isNumber {
                    multiplier.append(formula[index])
                    index += 1
                }
                
                if let multiplier = Int(String(multiplier)) {
                    map = map.mapValues { $0 * multiplier }
                }
                
                var lastMap = stack.popLast()!
                lastMap.merge(map, uniquingKeysWith: +)
                stack.append(lastMap)
            } else {
                var atom = [letter]
                index += 1
                
                while index < formula.endIndex && formula[index].isLowercase {
                    atom.append(formula[index])
                    index += 1
                }
                
                var count = [Character]()
                
                while index < formula.endIndex && formula[index].isNumber {
                    count.append(formula[index])
                    index += 1
                }
                
                var lastMap = stack.popLast()!
                lastMap[String(atom), default: 0] += Int(String(count)) ?? 1
                stack.append(lastMap)
            }
        }
        
        var answer = [Character]()
        
        for atom in stack[0].keys.sorted() {
            answer.append(contentsOf: atom)
            if let count = stack[0][atom], count > 1 {
                answer.append(contentsOf: "\(count)")
            }
        }
        
        return String(answer)
    }
}
