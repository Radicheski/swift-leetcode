//
//  CourseSchedule2.swift
//  https://leetcode.com/problems/course-schedule-ii/
//
//  Created by Erik Radicheski da Silva on 19/11/22.
//

import XCTest

final class CourseSchedule2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findOrder(2, [[1, 0]]), [0, 1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findOrder(4, [[1, 0], [2, 0], [3, 1], [3, 2]]), [0, 2, 1, 3])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findOrder(1, []), [0])
    }

}

private class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        guard prerequisites.isEmpty == false else { return Array(0 ..< numCourses) }
        
        var requisiteList = [Int: [Int]]()
        var indegree = Array(repeating: 0, count: numCourses)
        var topologicalOrder = Array(repeating: 0, count: numCourses)
        
        for i in 0 ..< prerequisites.count {
            let course = prerequisites[i][0]
            let requisite = prerequisites[i][1]
            requisiteList[requisite, default: []].append(course)
            indegree[course] += 1
        }
        
        var queue = [Int]()
        for i in 0 ..< numCourses {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }
        
        var counter = 0
        while queue.isEmpty == false {
            let node = queue.removeLast()
            topologicalOrder[counter] = node
            counter += 1
            
            for neighbor in requisiteList[node, default: []]{
                indegree[neighbor] -= 1
                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }
        
        if counter == numCourses {
            return topologicalOrder
        } else {
            return []
        }
    }

}
