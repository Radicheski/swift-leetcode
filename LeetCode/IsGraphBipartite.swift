//
//  IsGraphBipartite.swift
//  https://leetcode.com/problems/is-graph-bipartite/
//
//  Created by Erik Radicheski da Silva on 03/02/23.
//

import XCTest

final class IsGraphBipartite: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertFalse(solution.isBipartite([[1, 2, 3], [0, 2], [0, 1, 3], [0, 2]]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.isBipartite([[1, 3], [0, 2], [1, 3], [0, 2]]))
    }
    
}

private class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        var colors = graph.map { _ in Color.none }
        
        for i in colors.indices {
            if colors[i] == .none && validcolor(graph, &colors, .blue, i) == false {
                return false
            }
        }
        
        return true
    }
    
    private func validcolor(_ graph: [[Int]], _ colors: inout [Color], _ color: Color, _ node: Int) -> Bool {
        guard colors[node] == .none else { return colors[node] == color }
        
        colors[node] = color
        let neighborColor = color.oposite
        
        for neighbor in graph[node] {
            guard validcolor(graph, &colors, neighborColor, neighbor) else { return false }
        }
        
        return true
    }
    
    private enum Color: Int {
        case none, blue, green
        
        var oposite: Color {
            switch self {
            case .none: return .none
            case .blue: return .green
            case .green: return .blue
            }
        }
    }
}
