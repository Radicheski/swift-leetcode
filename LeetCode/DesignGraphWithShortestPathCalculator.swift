//
//  DesignGraphWithShortestPathCalculator.swift
//  https://leetcode.com/problems/design-graph-with-shortest-path-calculator/
//
//  Created by Erik Radicheski da Silva on 11/11/23.
//

import XCTest

final class DesignGraphWithShortestPathCalculator: XCTestCase {

    //TODO: Test case

}

private class Graph {
    
    private var costs: [[Int]]
    
    init(_ n: Int, _ edges: [[Int]]) {
        costs = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        
        costs.indices.forEach { costs[$0][$0] = 0 }

        for edge in edges {
            costs[edge[0]][edge[1]] = edge[2]
        }

        for i in costs.indices {
            for j in costs.indices {
                for k in costs.indices {
                    if costs[j][i] != Int.max && costs[i][k] != Int.max {
                        costs[j][k] = min(costs[j][k], costs[j][i] + costs[i][k])
                    }
                }
            }
        }
    }
    
    func addEdge(_ edge: [Int]) {
        for i in costs.indices {
            for j in costs.indices {
                if costs[i][edge[0]] != Int.max, costs[edge[1]][j] != Int.max {
                    costs[i][j] = min(costs[i][j], costs[i][edge[0]] + costs[edge[1]][j] + edge[2])
                }
            }
        }
    }
    
    func shortestPath(_ node1: Int, _ node2: Int) -> Int {
        guard costs[node1][node2] < .max else { return -1 }
        return costs[node1][node2]
    }
}
