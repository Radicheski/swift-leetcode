//
//  BuildAnArrayWithStackOperations.swift
//  https://leetcode.com/problems/build-an-array-with-stack-operations/
//
//  Created by Erik Radicheski da Silva on 03/11/23.
//

import XCTest

final class BuildAnArrayWithStackOperations: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.buildArray([1, 3], 3), ["Push", "Push", "Pop", "Push"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.buildArray([1, 2, 3], 3), ["Push", "Push", "Push"])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.buildArray([1, 2], 4), ["Push", "Push"])
    }

}

private class Solution {
    
    private let push = "Push"
    private let pop = "Pop"
    
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var targetIndex = 0
        var streamIndex = 1
        
        var answer = [String]()
        
        while targetIndex < target.endIndex {
            if target[targetIndex] == streamIndex {
                answer.append(push)
                targetIndex += 1
            } else {
                answer.append(contentsOf: [push, pop])
            }
            streamIndex += 1
        }
        
        return answer
    }
}
