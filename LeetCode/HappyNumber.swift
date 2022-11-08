//
//  HappyNumber.swift
//  https://leetcode.com/problems/happy-number/
//
//  Created by Erik Radicheski da Silva on 08/11/22.
//

import XCTest

final class HappyNumber: XCTestCase {

    private let solution = Solution()
    
    func testExampleA(){
        XCTAssertTrue(solution.isHappy(19))
    }
    
    func testExampleB(){
        XCTAssertFalse(solution.isHappy(2))
    }

}

private class Solution {
    func isHappy(_ n: Int) -> Bool {
        var number = n
        var set = Set([number])
        
        while number > 1 {
            let newNumber = transform(number)
            if set.contains(newNumber) { return false }
            set.insert(newNumber)
            number = newNumber
        }
        
        return true
    }
    
    private func transform(_ n: Int) -> Int {
        //        Array("\(n)")
        //            .map(String.init)
        //            .compactMap(Int.init)
        //            .map { $0 * $0 }
        //            .reduce(into: 0, +=)
        let array = Array("\(n)")
            .map(String.init)
            .compactMap(Int.init)
            .map { $0 * $0 }
        var result = 0
        
        for number in array {
            result += number
        }
        
        return result
    }
}
