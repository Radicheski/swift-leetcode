//
//  SortThePeople.swift
//  https://leetcode.com/problems/sort-the-people/
//
//  Created by Erik Radicheski da Silva on 22/07/24.
//

import XCTest

final class SortThePeople: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sortPeople(["Mary", "John", "Emma"], [180, 165, 170]), ["Mary", "Emma", "John"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sortPeople(["Alice", "Bob", "Bob"], [155, 185, 150]), ["Bob", "Alice", "Bob"])
    }
    
}

private class Solution {
    func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
        return heights.enumerated()
            .sorted(by: { $0.element > $1.element } )
            .map(\.offset).map { names[$0] }
    }
}
