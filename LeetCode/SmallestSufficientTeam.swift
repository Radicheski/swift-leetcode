//
//  SmallestSufficientTeam.swift
//  https://leetcode.com/problems/smallest-sufficient-team/
//
//  Created by Erik Radicheski da Silva on 16/07/23.
//

import XCTest

final class SmallestSufficientTeam: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.smallestSufficientTeam(["java", "nodejs", "reactjs"], [["java"], ["nodejs"], ["nodejs", "reactjs"]]), [0, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.smallestSufficientTeam(["algorithms", "math", "java", "reactjs", "csharp", "aws"], [["algorithms", "math", "java"], ["algorithms", "math", "reactjs"], ["java", "csharp", "aws"], ["reactjs", "csharp"], ["csharp", "math"], ["aws", "java"]]), [1, 2])
    }

}

private class Solution {
    func smallestSufficientTeam(_ reqSkills: [String], _ people: [[String]]) -> [Int] {
        let n = people.count
        let m = reqSkills.count
        
        let skillId = Dictionary(uniqueKeysWithValues: reqSkills.enumerated().map { ($0.element, $0.offset) } )
        
        let skillsMaskOfPerson = people.map { skills in
            var skillBitmask = 0
            skills.compactMap { skillId[$0] }.forEach { skillBitmask |= 1 << $0 }
            return skillBitmask
        }
        
        var dp = Array(repeating: (1 << n) - 1, count: 1 << m)
        dp[0] = 0
        
        for skillMask in 1 ..< (1 << m) {
            for i in 0 ..< n {
                let smallerSkillsMask = skillMask & ~skillsMaskOfPerson[i]
                if smallerSkillsMask != skillMask {
                    let peopleMask = dp[smallerSkillsMask] | (1 << i)
                    if peopleMask.nonzeroBitCount < dp[skillMask].nonzeroBitCount {
                        dp[skillMask] = peopleMask
                    }
                }
            }
        }
        
        let answerMask = dp[(1 << m) - 1]
        var answer = Array(repeating: 0, count: answerMask.nonzeroBitCount)
        var pointer = 0
        
        for i in 0 ..< n {
            if (answerMask >> i) & 1 == 1 {
                answer[pointer] = i
                pointer += 1
            }
        }
        
        return answer
    }
}
