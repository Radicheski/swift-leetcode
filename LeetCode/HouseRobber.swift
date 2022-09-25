//
//  HouseRobber.swift
//  https://leetcode.com/problems/house-robber/
//
//  Created by Erik Radicheski da Silva on 25/09/22.
//

import XCTest

final class HouseRobber: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.rob([1, 2, 3, 1]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.rob([2, 7, 9, 3, 1]), 12)
    }

}

private class Solution {
    
    func rob(_ nums: [Int]) -> Int {
        guard nums.isEmpty == false else { return 0 }
        if nums.count < 3 { return nums.max()! }
        
        let count = nums.count
        
        var result = [Int]()
        
        result.append(nums[count - 1])
        result.insert(nums[count - 2], at: 0)
        
        for index in 3 ... count {
            let scenarioA = nums[count - index] + result.dropFirst().max()!
            let scenarioB = result[0]
            
            result.insert(max(scenarioA, scenarioB), at: 0)
        }
        
        return result[0]
    }
    
}
