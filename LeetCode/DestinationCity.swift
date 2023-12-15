//
//  DestinationCity.swift
//  https://leetcode.com/problems/destination-city/
//
//  Created by Erik Radicheski da Silva on 15/12/23.
//

import XCTest

final class DestinationCity: XCTestCase {
    
    private var solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.destCity([["London", "New York"],
                                          ["New York", "Lima"],
                                          ["Lima", "Sao Paulo"]]), "Sao Paulo")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.destCity([["B", "C"], ["D", "B"], ["C", "A"]]), "A")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.destCity([["A", "Z"]]), "Z")
    }
    
}

private class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var cities = [String: Int]()
        
        for path in paths {
            cities[path[0], default: 0] += 1
            cities[path[1], default: 0] += 0
        }
        
        return cities.filter { $0.value == 0 }.first!.key
    }
}
