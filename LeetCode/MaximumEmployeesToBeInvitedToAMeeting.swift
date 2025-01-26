//
//  MaximumEmployeesToBeInvitedToAMeeting.swift
//  https://leetcode.com/problems/maximum-employees-to-be-invited-to-a-meeting/
//
//  Created by Erik Radicheski da Silva on 26/01/25.
//

import XCTest

final class MaximumEmployeesToBeInvitedToAMeeting: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumInvitations([2, 2, 1, 2]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumInvitations([1, 2, 0]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumInvitations([3, 0, 1, 4, 1]), 4)
    }
    
}

private class Solution {
    func maximumInvitations(_ favorite: [Int]) -> Int {
        let numPeople = favorite.count
        var reversedGraph = Array(repeating: [Int](), count: numPeople)

        for person in 0 ..< numPeople {
            reversedGraph[favorite[person]].append(person)
        }

        var longestCycle = 0
        var twoCycleInvitations = 0
        var visited = Array(repeating: false, count: numPeople)

        for person in 0 ..< numPeople {
            if visited[person] { continue }
            
            var visitedPersons = [Int: Int]()
            var currentPerson = person
            var distance = 0
            
            while true {
                if visited[currentPerson] { break }
                
                visited[currentPerson] = true
                visitedPersons[currentPerson] = distance
                distance += 1
                let nextPerson = favorite[currentPerson]

                if let nextDistance = visitedPersons[nextPerson] {
                    let cycleLength = distance - nextDistance
                    longestCycle = max(longestCycle, cycleLength)
                    
                    if cycleLength == 2 {
                        var visitedNodes = Set<Int>()
                        visitedNodes.formUnion([currentPerson, nextPerson])
                        twoCycleInvitations +=
                            2 +
                            bfs(nextPerson, &visitedNodes, reversedGraph) +
                            bfs(currentPerson, &visitedNodes, reversedGraph)
                    }
                    
                    break
                }
                currentPerson = nextPerson
            }

        }
        return max(longestCycle, twoCycleInvitations)
    }
    
    private func bfs(_ startNode: Int, _ visitedNodes: inout Set<Int>, _ reversedGraph: [[Int]]) -> Int {
        var queue = [(node: startNode, distance: 0)]
        var maxDistance = 0
        
        while queue.isEmpty == false {
            let (node, distance) = queue.removeFirst()
            
            for neighbor in reversedGraph[node] {
                if (false, neighbor) == visitedNodes.insert(neighbor) { continue }
                
                queue.append((neighbor, distance + 1))
                maxDistance = max(maxDistance, distance + 1)
            }
        }
        
        return maxDistance
    }
}
