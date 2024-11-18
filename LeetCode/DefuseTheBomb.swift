//
//  DefuseTheBomb.swift
//  https://leetcode.com/problems/defuse-the-bomb/
//
//  Created by Erik Radicheski da Silva on 18/11/24.
//

import XCTest

final class DefuseTheBomb: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.decrypt([5, 7, 1, 4], 3), [12, 10, 16, 13])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.decrypt([1, 2, 3, 4], 0), [0, 0, 0, 0])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.decrypt([2, 4, 9, 3], -2), [12, 5, 6, 13])
    }
    
}

private class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        let n = code.count
        var answer = Array(repeating: 0, count: n)
        
        if k == 0 { return answer }
        
        var start = k > 0 ? 1 : n - abs(k)
        var end = k > 0 ? k : n - 1
        
        var sum = code[start ... end].reduce(into: 0, +=)
        
        for i in answer.indices {
            answer[i] = sum
            sum -= code[start % n]
            sum += code[(end + 1) % n]
            
            start += 1
            end += 1
        }

        return answer
    }
}
