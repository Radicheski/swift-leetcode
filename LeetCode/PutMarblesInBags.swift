//
//  PutMarblesInBags.swift
//  https://leetcode.com/problems/put-marbles-in-bags/
//
//  Created by Erik Radicheski da Silva on 08/07/23.
//

import XCTest

final class PutMarblesInBags: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.putMarbles([1, 3, 5, 1], 2), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.putMarbles([1, 3], 2), 0)
    }

}

private class Solution {
    func putMarbles(_ weights: [Int], _ k: Int) -> Int {
        let n = weights.count
        var pairWeights = Array(repeating: 0, count: n - 1)
        
        for i in 0 ..< n - 1 {
            pairWeights[i] = weights[i] + weights[i + 1]
        }
        
        pairWeights.sort()
        
        var answer = 0
        
        for i in 0 ..< k - 1 {
            answer += pairWeights[n - 2 - i] - pairWeights[i]
        }
        
        return answer
    }
}
