//
//  MaximumNumberOfPointsFromGridQueries.swift
//  https://leetcode.com/problems/maximum-number-of-points-from-grid-queries/
//
//  Created by Erik Radicheski da Silva on 29/03/25.
//

import XCTest

final class MaximumNumberOfPointsFromGridQueries: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxPoints([[1, 2, 3], [2, 5, 7], [3, 5, 1]], [5, 6, 2]), [5, 8, 1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxPoints([[5, 2, 1], [1, 1, 2]], [3]), [0])
    }
    
}

private class Solution {
    private let directions: [(dRow: Int, dColumn: Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    
    func maxPoints(_ grid: [[Int]], _ queries: [Int]) -> [Int] {
        let rowCount = grid.count
        let columnCount = grid[0].count
        let cellCount = rowCount * columnCount
        
        let queries = queries.enumerated().sorted { $0.element < $1.element }
        let cells: [(row: Int, column: Int, value: Int)] = grid.enumerated().flatMap { (i, row) in
            row.enumerated().map { (j, value) in
                (i, j, value)
            }
        }.sorted { $0.value < $1.value }
        
        var unionFind = UnionFind(cellCount)
        var result = Array(repeating: 0, count: queries.count)
        var cellIndex = 0
        
        for query in queries {
            while cellIndex < cellCount && cells[cellIndex].value < query.element {
                let (row, column, value) = cells[cellIndex]
                
                for (dRow, dColumn) in directions {
                    let nextRow = row + dRow
                    let nextColumn = column + dColumn
                    
                    if (0 ..< rowCount).contains(nextRow)
                        && (0 ..< columnCount).contains(nextColumn)
                        && grid[nextRow][nextColumn] < query.element {
                        unionFind.union(row * columnCount + column, nextRow * columnCount + nextColumn)
                    }
                }
                
                cellIndex += 1
            }
            
            result[query.offset] = query.element > grid[0][0] ? unionFind.getSize(0) : 0
        }
        
        return result
    }
}

private struct UnionFind {
    
    private var parent: [Int]
    private var size: [Int]
    
    init(_ n: Int) {
        parent = Array(0 ..< n)
        size = Array(repeating: 1, count: n)
    }
    
    private mutating func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = find(parent[x])
        return parent[x]
    }
    
    mutating func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        
        if rootX == rootY { return }
        
        if size[rootX] > size[rootY] {
            parent[rootY] = rootX
            size[rootX] += size[rootY]
        } else {
            parent[rootX] = rootY
            size[rootY] += size[rootX]
        }
    }
    
    mutating func getSize(_ x: Int) -> Int {
        return size[find(x)]
    }
}
