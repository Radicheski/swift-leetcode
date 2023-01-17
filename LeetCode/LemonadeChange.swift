//
//  LemonadeChange.swift
//  https://leetcode.com/problems/lemonade-change/
//
//  Created by Erik Radicheski da Silva on 17/01/23.
//

import XCTest

final class LemonadeChange: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.lemonadeChange([5, 5, 5, 10, 20]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.lemonadeChange([5, 5, 10, 10, 20]))
    }

}

private class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var currentBills = [5: 0, 10: 0, 20: 0]
        
        for bill in bills {
            switch bill {
                
            case 5:
                currentBills[5]! += 1
            
            case 10:
                if currentBills[5]! == 0 {
                    return false
                }
                currentBills[10]! += 1
                currentBills[5]! -= 1
                
            case 20:
                if currentBills[10]! > 0 && currentBills[5]! > 0 {
                    currentBills[20]! += 1
                    currentBills[10]! -= 1
                    currentBills[5]! -= 1
                } else if currentBills[5]! > 2 {
                    currentBills[20]! += 1
                    currentBills[5]! -= 3
                } else {
                    return false
                }
                
            default:
                fatalError()
            }
        }
        
        return true
    }
}
