//
//  MaxPointsOnALine.swift
//  https://leetcode.com/problems/max-points-on-a-line/
//
//  Created by Erik Radicheski da Silva on 08/11/22.
//

import XCTest

final class MaxPointsOnALine: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxPoints([[1, 1], [2, 2], [3, 3]]), 3)
    }
    
    func testExampleB(){
        XCTAssertEqual(solution.maxPoints([[1, 1], [3, 2], [5, 3], [4, 1], [2, 3], [1, 4]]), 4)
    }
    
    func test() {
        XCTAssertEqual(solution.maxPoints([[2, 3], [3, 3], [-5, 3]]), 3)
    }
    
    func testA() {
        XCTAssertEqual(solution.maxPoints([[3,3],[1,4],[1,1],[2,1],[2,2]]), 3)
    }
    
    func testB() {
        XCTAssertEqual(solution.maxPoints([[0,0],[1,-1],[1,1]]), 2)
    }

}

private class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        guard points.count > 2 else { return points.count }
        var vectors = [Line: Set<Point>]()
        
        for i in 0 ..< points.endIndex - 1 {
            for j in i + 1 ..< points.endIndex {
                let pointA = Point(points[i])
                let pointB = Point(points[j])
                
                let line = Line(pointA, pointB)
                vectors[line, default: []].insert(pointA)
                vectors[line, default: []].insert(pointB)
            }
        }
        
        return vectors.values.map { $0.count }.max() ?? 0
    }
    
    private struct Point: Hashable {
        let x: Int
        let y: Int
        
        init(_ array: [Int]) {
            assert(array.count == 2)
            x = array[0]
            y = array[1]
        }
    }
    
    private struct Vector: Hashable {
        let dx: Int
        let dy: Int
        
        init(_ pointA: Point, _ pointB: Point) {
            let dx = pointA.x - pointB.x
            let dy = pointA.y - pointB.y
            
            if dx == 0 {
                self.dx = 0
                self.dy = 1
                return
            }
            
            if dy == 0 {
                self.dx = 1
                self.dy = 0
                return
            }
            
            let divisor = Self.gcd(abs(dx), abs(dy))
            
            self.dx = dx / divisor / dx.signum()
            self.dy = dy / divisor / dx.signum()
        }
        
        private static func gcd(_ m: Int, _ n: Int) -> Int {
            var a = 0
            var b = max(m, n)
            var r = min(m, n)

            while r != 0 {
                a = b
                b = r
                r = a % b
            }
            
            return b
        }
    }
    
    private struct Line: Hashable {
        let origin: Point
        let direction: Vector
        
        init(_ pointA: Point, _ pointB: Point) {
            self.origin = pointA
            self.direction = Vector(pointA, pointB)
        }
    }
}
