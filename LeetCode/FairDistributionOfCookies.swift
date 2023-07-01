//
//  FairDistributionOfCookies.swift
//  https://leetcode.com/problems/fair-distribution-of-cookies/
//
//  Created by Erik Radicheski da Silva on 01/07/23.
//

import XCTest

final class FairDistributionOfCookies: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.distributeCookies([8, 15, 10, 20, 8], 2), 31)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.distributeCookies([6, 1, 3, 2, 2, 4, 1, 2], 3), 7)
    }

}

private class Solution {
    func distributeCookies(_ cookies: [Int], _ k: Int) -> Int {
        var distribute = Array(repeating: 0, count: k)
        var zeroCount = k
        return depthFirst(0, &distribute, cookies, k, &zeroCount)
    }
    
    private func depthFirst(_ i: Int, _ distribute: inout [Int], _ cookies: [Int],
                            _ k: Int, _ zeroCount: inout Int) -> Int {
        if cookies.count - i < zeroCount {
            return .max
        }

        if i == cookies.count {
            var unfairness = Int.min;
            for value in distribute {
                unfairness = max(unfairness, value)
            }
            return unfairness
        }
        
        var answer = Int.max
        for j in 0 ..< k {
            zeroCount -= distribute[j] == 0 ? 1 : 0
            distribute[j] += cookies[i]
            
            answer = min(answer, depthFirst(i + 1, &distribute, cookies, k, &zeroCount))
            
            distribute[j] -= cookies[i]
            zeroCount += distribute[j] == 0 ? 1 : 0
        }
        
        return answer
    }
}
