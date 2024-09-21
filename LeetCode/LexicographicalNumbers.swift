//
//  LexicographicalNumbers.swift
//  https://leetcode.com/problems/lexicographical-numbers/
//
//  Created by Erik Radicheski da Silva on 21/09/24.
//

import XCTest

final class LexicographicalNumbers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.lexicalOrder(13), [1, 10, 11, 12, 13, 2, 3, 4, 5, 6, 7, 8, 9])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.lexicalOrder(2), [1, 2])
    }
    
}

private class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        return (1 ... 9).flatMap { depthFirst($0, n) }
    }
    
    private func depthFirst(_ i: Int, _ n: Int) -> [Int] {
        guard i <= n else { return [] }
        
        return [i] + (0 ... 9).flatMap { depthFirst(i * 10 + $0, n) }
    }
}
