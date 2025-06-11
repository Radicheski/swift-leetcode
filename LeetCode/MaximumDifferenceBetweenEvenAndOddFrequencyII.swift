//
//  MaximumDifferenceBetweenEvenAndOddFrequencyII.swift
//  https://leetcode.com/problems/maximum-difference-between-even-and-odd-frequency-ii/
//
//  Created by Erik Radicheski da Silva on 11/06/25.
//

import XCTest

final class MaximumDifferenceBetweenEvenAndOddFrequencyII: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxDifference("12233", 4), -1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxDifference("1122211", 3), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxDifference("110", 3), -1)
    }
    
}

private class Solution {
    func maxDifference(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        let n = s.count
        var answer = Int.min
        
        for a in "01234" {
            for b in "01234" {
                if a == b { continue }
                
                var best = Array(repeating: Int.max, count: 4)
                var count = (a: 0, b: 0)
                var previous = (a: 0, b: 0)
                var left = -1
                
                for right in 0 ..< n {
                    count.a += s[right] == a ? 1 : 0
                    count.b += s[right] == b ? 1 : 0
                    
                    while right - left >= k && count.b - previous.b >= 2 {
                        let leftStatus = ((previous.a & 1) << 1) | (previous.b & 1)
                        best[leftStatus] = min(best[leftStatus], previous.a - previous.b)
                        left += 1
                        previous.a += s[left] == a ? 1 : 0
                        previous.b += s[left] == b ? 1 : 0
                    }
                    
                    let rightStatus = ((count.a & 1) << 1) | (count.b & 1)
                    if best[rightStatus ^ 0b10] != .max {
                        answer = max(answer, count.a - count.b - best[rightStatus ^ 0b10])
                    }
                }
            }
        }
        
        return answer
    }
}
