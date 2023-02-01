//
//  OpenTheLock.swift
//  https://leetcode.com/problems/open-the-lock/
//
//  Created by Erik Radicheski da Silva on 01/02/23.
//

import XCTest

final class OpenTheLock: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.openLock(["0201", "0101", "0102", "1212", "2002"], "0202"), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.openLock(["8888"], "0009"), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.openLock(["8887", "8889", "8878", "8898", "8788", "8988", "7888", "9888"], "8888"), -1)
    }

}

private class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        guard deadends.contains("0000") == false else { return -1 }
        
        
        let target = target.compactMap { Int("\($0)") }
        
        let deadends = Set(deadends.map { d in d.compactMap { Int("\($0)") } })
        
        var queue = [[0, 0, 0, 0]]
        var seen = Set(queue)
        
        var steps = 0
        
        while queue.isEmpty == false {
            let size = queue.count
            
            for _ in 0 ..< size {
                let combination = queue.removeFirst()
                
                if combination == target {
                    return steps
                }
                
                for i in 0 ..< 4 {
                    for diff in [-1, 1] {
                        
                        var newCombination = combination
                        newCombination[i] += diff + 10
                        newCombination[i] %= 10
                        
                        if deadends.contains(newCombination) == false && seen.contains(newCombination) == false {
                            queue.append(newCombination)
                            seen.insert(newCombination)
                        }
                        
                    }
                }
                
            }
            
            steps += 1
        }
        
        return -1
    }
}
