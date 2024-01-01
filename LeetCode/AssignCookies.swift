//
//  AssignCookies.swift
//  https://leetcode.com/problems/assign-cookies/
//
//  Created by Erik Radicheski da Silva on 01/01/24.
//

import XCTest

final class AssignCookies: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findContentChildren([1, 2, 3], [1, 1]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findContentChildren([1, 2], [1, 2, 3]), 2)
    }
}

private class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var answer = 0
        
        let greed = g.sorted(by: >)
        let size = s.sorted(by: >)
        
        var greedIndex = 0
        var sizeIndex = 0
        
        while greed.indices.contains(greedIndex) && size.indices.contains(sizeIndex) {
            if size[sizeIndex] >= greed[greedIndex] {
                answer += 1
                sizeIndex += 1
            }
            
            greedIndex += 1
        }
        
        return answer
    }
}
