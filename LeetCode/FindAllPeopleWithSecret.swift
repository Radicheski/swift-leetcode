//
//  FindAllPeopleWithSecret.swift
//  https://leetcode.com/problems/find-all-people-with-secret/
//
//  Created by Erik Radicheski da Silva on 24/02/24.
//

import XCTest

final class FindAllPeopleWithSecret: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findAllPeople(6, [[1, 2, 5], [2, 3, 8], [1, 5, 10]], 1), [0, 1, 2, 3, 5])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findAllPeople(4, [[3, 1, 3], [1, 2, 2], [0, 3, 3]], 3), [0, 1, 3])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findAllPeople(5, [[3, 4, 2], [1, 2, 1], [2, 3, 1]], 1), [0, 1, 2, 3, 4])
    }
    
}

private class Solution {
    func findAllPeople(_ n: Int, _ meetings: [[Int]], _ firstPerson: Int) -> [Int] {
        var graph = [Int: [(person: Int, time: Int)]]()
        
        for meeting in meetings {
            let (x, y) = (meeting[0], meeting[1])
            let time = meeting[2]
            
            graph[x, default: []].append((y, time))
            graph[y, default: []].append((x, time))
        }
        
        var queue = [(person: Int, time: Int)]()
        
        queue.append((0, 0))
        queue.append((firstPerson, 0))
        
        var earliest = Array(repeating: Int.max, count: n)
        earliest[0] = 0
        earliest[firstPerson] = 0
        
        while queue.isEmpty == false {
            let (person, time) = queue.removeFirst()
            
            for (nextPerson, meetingTime) in graph[person, default: []] {
                guard time <= meetingTime else { continue }
                guard meetingTime < earliest[nextPerson] else { continue }
                
                earliest[nextPerson] = meetingTime
                queue.append((nextPerson, meetingTime))
            }
        }
        
        return earliest.enumerated().filter { $0.element < .max }.map(\.offset)
    }
}
