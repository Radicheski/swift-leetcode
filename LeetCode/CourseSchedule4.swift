//
//  CourseSchedule4.swift
//  https://leetcode.com/problems/course-schedule-iv/
//
//  Created by Erik Radicheski da Silva on 27/01/25.
//

import XCTest

final class CourseSchedule4: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.checkIfPrerequisite(2, [[1, 0]], [[0, 1], [1, 0]]), [false, true])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.checkIfPrerequisite(2, [], [[1, 0], [0, 1]]), [false, false])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.checkIfPrerequisite(3, [[1, 2], [1, 0], [2, 0]], [[1, 0], [1, 2]]), [true, true])
    }
    
}

private class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var graph = [Int: [Int]]()
        
        for prerequisite in prerequisites {
            graph[prerequisite[0], default: []].append(prerequisite[1])
        }
        
        var isReachable: [[Bool]] = Array(repeating: Array(repeating: false, count: numCourses), count: numCourses)
        
        for start in 0 ..< numCourses {
            var queue = [start]
            
            while let course = queue.popLast() {
                guard let nextCourses = graph[course] else { continue }
                
                for next in nextCourses {
                    if isReachable[start][next] == false {
                        queue.append(next)
                    }
                    
                    isReachable[start][next] = true
                }
            }
        }
        
        return queries.compactMap { isReachable[$0[0]][$0[1]] }
    }
}
