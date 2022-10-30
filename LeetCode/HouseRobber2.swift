//
//  HouseRobber2.swift
//  https://leetcode.com/problems/house-robber-ii/
//
//  Created by Erik Radicheski da Silva on 30/10/22.
//

import XCTest

final class HouseRobber2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.rob([2, 3, 2]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.rob([1, 2, 3, 1]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.rob([1, 2, 3]), 3)
    }
}

private class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.endIndex > 2 else { return nums.max() ?? 0 }
        let scenarioA = Array(nums[0...(nums.endIndex - 2)])
        let scenarioB = Array(nums[1...(nums.endIndex - 1)])
        return max(subrob(scenarioA), subrob(scenarioB))
    }
    
    private func subrob(_ nums: [Int]) -> Int {
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
