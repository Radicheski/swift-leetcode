//
//  KthSymbolInGrammar.swift
//  https://leetcode.com/problems/k-th-symbol-in-grammar/
//
//  Created by Erik Radicheski da Silva on 25/10/23.
//

import XCTest

final class KthSymbolInGrammar: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.kthGrammar(1, 1), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.kthGrammar(2, 1), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.kthGrammar(2, 2), 1)
    }

}

private class Solution {
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        return kthGrammar(n, k, 0)
    }
    
    private func kthGrammar(_ n: Int, _ k: Int, _ start: Int) -> Int {
        guard n > 1 else { return start }
        
        let halfNodes = 1 << (n - 2)
        
        if k <= halfNodes {
            return kthGrammar(n - 1, k, start)
        } else {
            return kthGrammar(n - 1, k - halfNodes, 1 - start)
        }
    }
}
