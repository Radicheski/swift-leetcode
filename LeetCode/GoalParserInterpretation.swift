//
//  GoalParserInterpretation.swift
//  https://leetcode.com/problems/goal-parser-interpretation/
//
//  Created by Erik Radicheski da Silva on 27/12/22.
//

import XCTest

final class GoalParserInterpretation: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.interpret("G()(al)"), "Goal")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.interpret("G()()()()(al)"), "Gooooal")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.interpret("(al)G(al)()()G"), "alGalooG")
    }
}

private class Solution {
    func interpret(_ command: String) -> String {
        var result = [Character]()
        var command = Array(command)
        
        var temporaryCommand = [Character]()
        
        while command.isEmpty == false {
            temporaryCommand.append(command.removeFirst())
            switch temporaryCommand {
            case ["G"]:
                result.append("G")
                temporaryCommand.removeAll(keepingCapacity: true)
            case ["(", ")"]:
                result.append("o")
                temporaryCommand.removeAll(keepingCapacity: true)
            case ["(", "a", "l", ")"]:
                result.append(contentsOf: ["a", "l"])
                temporaryCommand.removeAll(keepingCapacity: true)
            default:
                continue
            }
        }
        
        return String(result)
    }
}
