//
//  FindTheTownJudge.swift
//  https://leetcode.com/problems/find-the-town-judge/
//
//  Created by Erik Radicheski da Silva on 16/10/22.
//

import XCTest

final class FindTheTownJudge: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findJudge(2, [[1, 2]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findJudge(3, [[1, 3], [2, 3]]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findJudge(3, [[1, 3], [2, 3], [3, 1]]), -1)
    }

}

private class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var possibleJudges = Dictionary(uniqueKeysWithValues: (1 ... n).map { ($0, Set<Int>()) })
        
        for person in trust {
            possibleJudges.removeValue(forKey: person[0])
            if var judge = possibleJudges[person[1]] {
                judge.insert(person[0])
                possibleJudges[person[1]] = judge
            }
        }
        
        if possibleJudges.isEmpty {
            return -1
        }
        
        for judge in possibleJudges {
            var set = Set(1 ... n)
            set.remove(judge.key)
            if judge.value == set {
                return judge.key
            }
        }
        
        return -1
    }
}
