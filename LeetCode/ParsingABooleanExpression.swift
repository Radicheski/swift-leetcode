//
//  ParsingABooleanExpression.swift
//  https://leetcode.com/problems/parsing-a-boolean-expression/
//
//  Created by Erik Radicheski da Silva on 20/10/24.
//

import XCTest

final class ParsingABooleanExpression: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertFalse(solution.parseBoolExpr("&(|(f))"))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.parseBoolExpr("|(f,f,f,t)"))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.parseBoolExpr("!(&(f,t))"))
    }
    
}

private class Solution {
    func parseBoolExpr(_ expression: String) -> Bool {
        var stack = [Character]()
        
        for char in expression {
            guard Set(["(", ","]).contains(char) == false else { continue }
            
            if char == ")" {
                var operands = [Bool]()
                var operation: (([Bool]) -> Bool)?
                
                while let last = stack.popLast() {
                    if last == "f" || last == "t" {
                        operands.append(last == "t")
                    } else {
                        switch last {
                        case "&": operation = and
                        case "|": operation = or
                        case "!": operation = negate
                        default: fatalError("Invalid operation")
                        }
                        break
                    }
                }
                
                stack.append(operation!(operands) ? "t" : "f")
            } else {
                stack.append(char)
            }
        }
        
        assert(stack.count == 1, "Invalid expression")
        
        return stack[0] == "t"
    }
    
    private func negate(_ term: [Bool]) -> Bool {
        assert(term.count == 1, "Invalid expression")
        return !term[0]
    }
    
    private func and(_ terms: [Bool]) -> Bool {
        for term in terms {
            if term == false { return false }
        }
        
        return true
    }
    
    private func or(_ terms: [Bool]) -> Bool {
        for term in terms {
            if term == true { return true }
        }
        
        return false
    }
}
