//
//  MinimumAreaRectangle2.swift
//  https://leetcode.com/problems/minimum-area-rectangle-ii/
//
//  Created by Erik Radicheski da Silva on 14/02/23.
//

import XCTest

final class MinimumAreaRectangle2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minAreaFreeRect([[1, 2], [2, 1], [1, 0], [0, 1]]), 2, accuracy: 1e-5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minAreaFreeRect([[0, 1], [2, 1], [1, 1], [1, 0], [2, 0]]), 1, accuracy: 1e-5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minAreaFreeRect([[0, 3], [1, 2], [3, 1], [1, 3], [2, 1]]), 0, accuracy: 1e-5)
    }

}

private class Solution {
    func minAreaFreeRect(_ points: [[Int]]) -> Double {
        guard points.count >= 4 else { return 0 }
        
        var map = [[Diagonal]]()
        
        for i in points.indices {
            for j in points.indices where j > i {
                let diagonal = Diagonal(start: points[i], end: points[j])
                
                if let index = map.firstIndex(where: { $0.contains(diagonal) } ) {
                    map[index].append(diagonal)
                } else {
                    map.append([diagonal])
                }
            }
        }
        
        var minimumArea = Double.infinity
        
        for list in map where list.count > 1 {
            for i in list.indices {
                for j in list.indices where j > i {
                    let diagonalA = list[i]
                    let diagonalB = list[j]
                    
                    let vectorX = (dx: diagonalA.dx + diagonalB.dx, dy: diagonalA.dy + diagonalB.dy)
                    let vectorY = (dx: diagonalA.dx - diagonalB.dx, dy: diagonalA.dy - diagonalB.dy)
                    
                    let absX = sqrt(Double(vectorX.dx * vectorX.dx + vectorX.dy * vectorX.dy)) / 2
                    let absY = sqrt(Double(vectorY.dx * vectorY.dx + vectorY.dy * vectorY.dy)) / 2
                    
                    let area = absX * absY
                    
                    if area > 0 {
                        minimumArea = min(minimumArea, area)
                    }
                }
            }
        }
        
        return minimumArea == .infinity ? 0 : minimumArea
    }
    
    private struct Diagonal: Hashable {
        let startX: Int
        let startY: Int
        let endX: Int
        let endY: Int
        
        init(start: [Int], end: [Int]) {
            startX = start[0]
            startY = start[1]
            endX = end[0]
            endY = end[1]
        }
        
        var length: Int {
            dx * dx + dy * dy
        }
        
        var midX: Double {
            Double(endX + startX) / 2
        }
        
        var midY: Double {
            Double(endY + startY) / 2
        }
        
        var dx: Int {
            endX - startX
        }
        
        var dy: Int {
            endY - startY
        }
        
        static func ==(lhs: Diagonal, rhs: Diagonal) -> Bool {
            lhs.length == rhs.length && lhs.midX == rhs.midX && lhs.midY == rhs.midY
        }
    }
}
