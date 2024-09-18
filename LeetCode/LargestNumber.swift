//
//  LargestNumber.swift
//  https://leetcode.com/problems/largest-number/
//
//  Created by Erik Radicheski da Silva on 18/09/24.
//

import XCTest

final class LargestNumber: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestNumber([10, 2]), "210")
    }
    
    func testExampleB(){
        XCTAssertEqual(solution.largestNumber([3, 30, 34, 5, 9]), "9534330")
    }
    
}

private class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var strings = nums.map { "\($0)" }.sorted(by: compare)
        
        guard strings[0] != "0" else { return "0" }
        
        return strings.reduce(into: "", +=)
    }
    
    private func compare(_ lhs: String, _ rhs: String) -> Bool {
        lhs + rhs > rhs + lhs ? true : false
    }
}
