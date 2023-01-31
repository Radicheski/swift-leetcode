//
//  JumpGame3.swift
//  https://leetcode.com/problems/jump-game-iii/
//
//  Created by Erik Radicheski da Silva on 31/01/23.
//

import XCTest

final class JumpGame3: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canReach([4, 2, 3, 0, 3, 1, 2], 5))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.canReach([4, 2, 3, 0, 3, 1, 2], 0))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.canReach([3, 0, 2, 1, 2], 2))
    }
    
}

private class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var visited = Array(repeating: false, count: arr.count)
        
        let direction = [-1, 1]
        
        var queue = [start]
        
        while queue.isEmpty == false {
            let index = queue.removeFirst()
            
            guard arr[index] != 0 else { return true }
            
            for dx in direction {
                let newIndex = index + dx * arr[index]
                
                guard arr.indices.contains(newIndex) else { continue }
                guard visited[newIndex] == false else { continue }
                
                visited[newIndex] = true
                queue.append(newIndex)
            }
            
        }
        
        return false
    }
}
