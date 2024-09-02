//
//  FindTheStudentThatWillReplaceTheChalk.swift
//  https://leetcode.com/problems/find-the-student-that-will-replace-the-chalk/
//
//  Created by Erik Radicheski da Silva on 02/09/24.
//

import XCTest

final class FindTheStudentThatWillReplaceTheChalk: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.chalkReplacer([5, 1, 5], 22), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.chalkReplacer([3, 4, 1, 2], 25), 1)
    }
    
}

private class Solution {
    func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
        guard chalk.count > 1 else { return 0 }
        
        var k = k
        
        var prefix = Array(repeating: 0, count: chalk.count)
        prefix[0] = chalk[0]
        
        for i in 1 ..< prefix.endIndex {
            prefix[i] = prefix[i - 1] + chalk[i]
        }
        
        k %= prefix.last!
        
        for i in prefix.indices {
            if k < prefix[i] { return i }
        }
        
        return -1
    }
}
