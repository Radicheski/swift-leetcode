//
//  RestoreTheArray.swift
//  https://leetcode.com/problems/restore-the-array/
//
//  Created by Erik Radicheski da Silva on 23/04/23.
//

import XCTest

final class RestoreTheArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfArrays("1000", 10000), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfArrays("1000", 10), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numberOfArrays("1317", 2000), 8)
    }

}

private class Solution {
    private let mod = 1000000007
    
    func numberOfArrays(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        var memo = Array(repeating: 0, count: s.endIndex + 1)
        return depthFirst(s, k, 0, &memo)
    }
    
    private func depthFirst(_ s: [Character], _ k: Int, _ start: Int, _ memo: inout [Int]) -> Int {
        guard memo[start] == 0 else { return memo[start] }
        guard start < s.endIndex else { return 1 }
        guard s[start] != "0" else { return 0 }
        
        var count = 0
        
        for end in start ..< s.endIndex {
            let currentNumber = String(s[start ... end])
            
            if let number = Int(currentNumber),
               number > k {
                break
            }
            
            count = (count + depthFirst(s, k, end + 1, &memo)) % mod
        }
        
        memo[start] = count
        return count
    }
}
