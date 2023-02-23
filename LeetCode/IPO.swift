//
//  IPO.swift
//  https://leetcode.com/problems/ipo/
//
//  Created by Erik Radicheski da Silva on 23/02/23.
//

import XCTest

final class IPO: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMaximizedCapital(2, 0, [1, 2, 3], [0, 1, 1]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMaximizedCapital(3, 0, [1, 2, 3], [0, 1, 2]), 6)
    }

}

private class Solution {
    func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
        var w = w
        
        var projects = [(capital: Int, profit: Int)]()
        
        for i in profits.indices {
            projects.append((capital[i], profits[i]))
        }
        
        projects.sort { $0.capital < $1.capital }
        
        var pointer = 0
        var possibleProfits = [Int: Int]()
        
        for _ in 0 ..< k {
            while projects.indices.contains(pointer) && projects[pointer].capital <= w {
                possibleProfits[projects[pointer].profit, default: 0] += 1
                pointer += 1
            }
            
            guard let maxProfit = possibleProfits.keys.max() else { break }
            guard var profitCounter = possibleProfits.removeValue(forKey: maxProfit) else { break }
            
            w += maxProfit
            profitCounter -= 1
            
            if profitCounter > 0 {
                possibleProfits[maxProfit] = profitCounter
            }
            
        }
        
        return w
    }
}
