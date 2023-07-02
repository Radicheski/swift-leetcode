//
//  MaximumNumberOfAchievableTransferRequests.swift
//  https://leetcode.com/problems/maximum-number-of-achievable-transfer-requests/
//
//  Created by Erik Radicheski da Silva on 02/07/23.
//

import XCTest

final class MaximumNumberOfAchievableTransferRequests: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumRequests(5, [[0, 1], [1, 0], [0, 1], [1, 2], [2, 0], [3, 4]]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumRequests(3, [[0, 0], [1, 2], [2, 1]]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumRequests(4, [[0, 3], [3, 1], [1, 2], [2, 0]]), 4)
    }

}

private class Solution {
    func maximumRequests(_ n: Int, _ requests: [[Int]]) -> Int {
        var indegree = Array(repeating: 0, count: n)
        var answer = 0
        
        maximumRequests(requests, &indegree, n, 0, 0, &answer)
        
        return answer
    }
    
    private func maximumRequests(_ requests: [[Int]], _ indegree: inout [Int], _ n: Int,
                                 _ index: Int, _ count: Int, _ answer: inout Int) {
        guard index < requests.count else {
            if indegree.allSatisfy( { $0 == 0 } ) {
                answer = max(answer, count)
            }
            return
        }
        
        indegree[requests[index][0]] -= 1
        indegree[requests[index][1]] += 1
        
        maximumRequests(requests, &indegree, n, index + 1, count + 1, &answer)
        
        indegree[requests[index][0]] += 1
        indegree[requests[index][1]] -= 1
        
        maximumRequests(requests, &indegree, n, index + 1, count, &answer)
    }
}
