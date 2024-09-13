//
//  XORQueriesOfASubarray.swift
//  testLeetcode
//
//  Created by Erik Radicheski da Silva on 13/09/24.
//

import XCTest

final class XORQueriesOfASubarray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.xorQueries([1, 3, 4, 8], [[0, 1], [1, 2], [0, 3], [3, 3]]), [2, 7, 14, 8])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.xorQueries([4, 8, 2, 10], [[2, 3], [1, 3], [0, 0], [0, 3]]), [8, 0, 4, 4])
    }
    
}

private class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var prefix = Array(repeating: 0, count: arr.count + 1)
        
        for i in arr.indices {
            prefix[i + 1] = prefix[i] ^ arr[i]
        }
        
        return queries.map { prefix[$0[0]] ^ prefix[$0[1] + 1] }
    }
}
