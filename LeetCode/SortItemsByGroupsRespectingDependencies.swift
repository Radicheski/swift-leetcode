//
//  SortItemsByGroupsRespectingDependencies.swift
//  https://leetcode.com/problems/sort-items-by-groups-respecting-dependencies/
//
//  Created by Erik Radicheski da Silva on 20/08/23.
//

import XCTest

final class SortItemsByGroupsRespectingDependencies: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sortItems(8, 2, [-1, -1, 1, 0, 0, 1, 0, -1], [[], [6], [5], [6], [3, 6], [], [], []]), [6, 3, 4, 1, 5, 2, 0, 7])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sortItems(8, 2, [-1, -1, 1, 0, 0, 1, 0, -1], [[], [6], [5], [6], [3], [], [4],[]]), [])
    }
}

private class Solution {
    func sortItems(_ n: Int, _ m: Int, _ group: [Int], _ beforeItems: [[Int]]) -> [Int] {
        var group = group
        var groupId = m
        
        for i in 0 ..< n where group[i] == -1 {
            group[i] = groupId
            groupId += 1
        }
        
        var itemGraph = [Int: [Int]]()
        var itemIndegree = Array(repeating: 0, count: n)
        for i in 0 ..< n {
            itemGraph[i] = []
        }
        
        var groupGraph = [Int: [Int]]()
        var groupIndegree = Array(repeating: 0, count: groupId)
        for i in 0 ..< groupId {
            groupGraph[i] = []
        }
        
        for current in 0 ..< n {
            for previous in beforeItems[current] {
                itemGraph[previous, default: []].append(current)
                itemIndegree[current] += 1
                
                if group[current] != group[previous] {
                    groupGraph[group[previous], default: []].append(group[current])
                    groupIndegree[group[current]] += 1
                }
            }
        }
        
        let itemOrder = topologicalSort(itemGraph, itemIndegree)
        let groupOrder = topologicalSort(groupGraph, groupIndegree)
        
        if itemOrder.isEmpty || groupOrder.isEmpty {
            return []
        }
        
        var orderedGroups = [Int: [Int]]()
        for item in itemOrder {
            orderedGroups[group[item], default: []].append(item)
        }
        
        var answerList = [Int]()
        for groupIndex in groupOrder {
            answerList.append(contentsOf: orderedGroups[groupIndex, default: []])
        }
        
        return answerList
    }
    
    private func topologicalSort(_ graph: [Int: [Int]], _ indegree: [Int]) -> [Int] {
        var indegree = indegree
        
        var visited = [Int]()
        var stack = [Int]()
        
        for key in graph.keys where indegree[key] == 0 {
            stack.append(key)
        }
        
        while stack.isEmpty == false {
            let current = stack.removeLast()
            visited.append(current)
            
            for previous in graph[current, default: []] {
                indegree[previous] -= 1
                
                if indegree[previous] == 0 {
                    stack.append(previous)
                }
            }
        }
        
        return visited.count == graph.count ? visited : []
    }
}
