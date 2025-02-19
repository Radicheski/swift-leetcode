//
//  TheKthLexicographicalStringOfAllHappyStringsOfLengthN.swift
//  https://leetcode.com/problems/the-k-th-lexicographical-string-of-all-happy-strings-of-length-n/
//
//  Created by Erik Radicheski da Silva on 19/02/25.
//

import XCTest

final class TheKthLexicographicalStringOfAllHappyStringsOfLengthN: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getHappyString(1, 3), "c")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getHappyString(1, 4), "")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.getHappyString(3, 9), "cab")
    }
    
}

private class Solution {
    func getHappyString(_ n: Int, _ k: Int) -> String {
        let happyString = generateHappyStrings([], n)
            .map { String($0) }
            .sorted()
        
        return happyString.indices.contains(k - 1) ? happyString[k - 1] : ""
    }
    
    private func generateHappyStrings(_ s: [Character], _ n: Int) -> [[Character]] {
        guard s.count < n else { return [s] }
        
        var answer = [[Character]]()
        
        for c in Array("abc") {
            if s.last != c {
                answer.append(contentsOf: generateHappyStrings(s + [c], n))
            }
        }
        
        return answer
    }
}
