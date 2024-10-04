//
//  DividePlayersIntoTeamsofEqualSkill.swift
//  https://leetcode.com/problems/divide-players-into-teams-of-equal-skill/
//
//  Created by Erik Radicheski da Silva on 04/10/24.
//

import XCTest

final class DividePlayersIntoTeamsofEqualSkill: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.dividePlayers([3, 2, 5, 1, 3, 4]), 22)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.dividePlayers([3, 4]), 12)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.dividePlayers([1, 1, 2, 3]), -1)
    }
    
}

private class Solution {
    func dividePlayers(_ skill: [Int]) -> Int {
        var totalSkill = skill.reduce(into: 0, +=)
        let skillSum = 2 * totalSkill / skill.count
        
        let skillCount = Dictionary(skill.map { ($0, 1) }, uniquingKeysWith: +)
        var totalChemistry = 0
        
        for (s, c) in skillCount {
            if let pairCount = skillCount[skillSum - s] {
                guard c == pairCount else { return -1 }
                
                totalChemistry += c * s * (skillSum - s)
            } else {
                return -1
            }
        }
        
        return totalChemistry / 2
        
    }
}
