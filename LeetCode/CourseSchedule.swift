//
//  CourseSchedule.swift
//  https://leetcode.com/problems/course-schedule/
//
//  Created by Erik Radicheski da Silva on 13/07/23.
//

import XCTest

final class CourseSchedule: XCTestCase {

    private let solutio = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solutio.canFinish(2, [[1, 0]]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solutio.canFinish(2, [[1, 0], [0, 1]]))
    }

}

private class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var indegree = Array(repeating: 0, count: numCourses)
        var adj = Array(repeating: [Int](), count: numCourses)
        
        for prerequisite in prerequisites {
            adj[prerequisite[1]].append(prerequisite[0])
            indegree[prerequisite[0]] += 1
        }
        
        var queue = indegree.enumerated().filter { $0.element == 0 }.map { $0.offset }
        
        var nodesVisited = 0
        
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            nodesVisited += 1
            
            for neighbor in adj[node] {
                indegree[neighbor] -= 1
                
                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }
        
        return nodesVisited == numCourses
    }
}
