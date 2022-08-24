//
//  FloodFill.swift
//  https://leetcode.com/problems/flood-fill/
//
//  Created by Erik Radicheski da Silva on 24/08/22.
//

import XCTest

class FloodFill: XCTestCase {
    
    func test() {
        let solution = Solution()
        
        var original: [[Int]]
        var output: [[Int]]
        
        original = [[1,1,1],[1,1,0],[1,0,1]]
        output = [[2,2,2],[2,2,0],[2,0,1]]
        XCTAssertEqual(solution.floodFill(original, 1, 1, 2), output)
        
        original = [[0,0,0],[0,0,0]]
        output = [[0,0,0],[0,0,0]]
        XCTAssertEqual(solution.floodFill(original, 0, 0, 0), output)
    }
    
}

private class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var queue = [(row: Int, column: Int)]()
        
        queue.append((sr, sc))
        
        let originalColor = image[sr][sc]
        var result = image
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if checkIndex(result, index: node, oldColor: originalColor, newColor: color) {
                result[node.row][node.column] = color
            }
            
            let north = (row: node.row - 1, column: node.column)
            if checkIndex(result, index: north, oldColor: originalColor, newColor: color) {
                result[north.row][north.column] = color
                queue.append(north)
            }
            
            let south = (row: node.row + 1, column: node.column)
            if checkIndex(result, index: south, oldColor: originalColor, newColor: color) {
                result[south.row][south.column] = color
                queue.append(south)
            }
            
            let east = (row: node.row, column: node.column - 1)
            if checkIndex(result, index: east, oldColor: originalColor, newColor: color) {
                result[east.row][east.column] = color
                queue.append(east)
            }
            
            let west = (row: node.row, column: node.column + 1)
            if checkIndex(result, index: west, oldColor: originalColor, newColor: color) {
                result[west.row][west.column] = color
                queue.append(west)
            }
            
        }
        
        return result
    }
    
    private func checkIndex(_ image: [[Int]], index: (row: Int, column: Int), oldColor: Int, newColor: Int) -> Bool {
        let rowRange = 0..<image.count
        if !rowRange.contains(index.row) { return false }
        
        let columnRange = 0..<image[0].count
        if !columnRange.contains(index.column) { return false }
        
        return image[index.row][index.column] == oldColor
            && image[index.row][index.column] != newColor
    }
}
