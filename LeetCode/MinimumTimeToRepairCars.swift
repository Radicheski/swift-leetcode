//
//  MinimumTimeToRepairCars.swift
//  https://leetcode.com/problems/minimum-time-to-repair-cars/
//
//  Created by Erik Radicheski da Silva on 16/03/25.
//

import XCTest

final class MinimumTimeToRepairCars: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.repairCars([4, 3, 2, 1], 10), 16)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.repairCars([5, 1, 8], 6), 16)
    }
    
}

private class Solution {
    func repairCars(_ ranks: [Int], _ cars: Int) -> Int {
        let ranks = Dictionary(ranks.map { ($0, 1) }, uniquingKeysWith: +)
        var left = 1
        var right = ranks.keys.min()! * cars * cars
        
        while left < right {
            let middle = left + (right - left) / 2
            
            var carsFixed = 0
            
            for (rank, count) in ranks {
                carsFixed += count * Int(sqrt(Double(middle) / Double(rank)))
            }
            
            if carsFixed >= cars {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
}
