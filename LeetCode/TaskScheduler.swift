//
//  TaskScheduler.swift
//  https://leetcode.com/problems/task-scheduler/
//
//  Created by Erik Radicheski da Silva on 13/11/22.
//

import XCTest

final class TaskScheduler: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.leastInterval(["A", "A", "A", "B", "B", "B"], 2), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.leastInterval(["A", "A", "A", "B", "B", "B"], 0), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.leastInterval(["A", "A", "A", "A", "A", "A", "B", "C", "D", "E", "F", "G"], 2), 16)
    }
    
}

private class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var tasksCount = getTaskCount(tasks)
        var tasksSchedule = [Character: Int]()
        
        var duration = 0
        
        while tasksCount.isEmpty == false {
            duration += 1
            
            guard var task = tasksCount.first(where: { tasksSchedule[$0.key, default: 0] < duration }) else {
                continue
            }
            
            task.value -= 1
            tasksCount[task.key] = task.value
            tasksSchedule[task.key, default: 0] += n + 1
            
            tasksCount.filter { $0.value == 0 }.forEach { let _ = tasksCount.removeValue(forKey: $0.key) }
        }
        
        return duration
    }
    
    private func getTaskCount(_ tasks: [Character]) -> [Character: Int] {
        let taskTuples = tasks.map { ($0, 1) }
        return Dictionary(taskTuples, uniquingKeysWith: +)
    }
}
