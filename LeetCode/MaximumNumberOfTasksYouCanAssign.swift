//
//  MaximumNumberOfTasksYouCanAssign.swift
//  https://leetcode.com/problems/maximum-number-of-tasks-you-can-assign/
//
//  Created by Erik Radicheski da Silva on 01/05/25.
//

import XCTest

final class MaximumNumberOfTasksYouCanAssign: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxTaskAssign([3, 2, 1], [0, 3, 3], 1, 1), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxTaskAssign([5, 4], [0, 0, 0], 1, 5), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxTaskAssign([10, 15, 30], [0, 10, 10, 10, 10], 3, 10), 2)
    }
    
}

private class Solution {
    func maxTaskAssign(_ tasks: [Int], _ workers: [Int], _ pills: Int, _ strength: Int) -> Int {
        let tasks = tasks.sorted()
        let workers = workers.sorted()
        
        var right = min(tasks.count, workers.count)
        var left = 0
        var answer = 0
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if canAssign(tasks, workers, pills, strength, middle) {
                answer = middle
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        return answer
    }
    
    private func canAssign(_ tasks: [Int], _ workers: [Int], _ pills: Int, _ strength: Int, _ k: Int) -> Bool {
        let tasks = Array(tasks.prefix(k).reversed())
        var workers = Array(workers.suffix(k))
        var pills = pills
        
        for task in tasks {
            if let last = workers.last, last >= task {
                workers.removeLast()
            } else if pills > 0 {
                if let index = workers.firstIndex(where: { $0 + strength >= task }) {
                    workers.remove(at: index)
                    pills -= 1
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        
        return true
    }
}
