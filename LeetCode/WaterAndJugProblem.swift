//
//  WaterAndJugProblem.swift
//  https://leetcode.com/problems/water-and-jug-problem/
//
//  Created by Erik Radicheski da Silva on 31/01/23.
//

import XCTest

final class WaterAndJugProblem: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canMeasureWater(3, 5, 4))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canMeasureWater(2, 6, 5))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.canMeasureWater(1, 2, 3))
    }

}

private class Solution {
    func canMeasureWater(_ jug1Capacity: Int, _ jug2Capacity: Int, _ targetCapacity: Int) -> Bool {
        let smallerJug = min(jug1Capacity, jug2Capacity)
        let biggerJug = max(jug1Capacity, jug2Capacity)
        
        guard targetCapacity <= smallerJug + biggerJug else { return false }
        
        var queue = [Pair(left: 0, right: 0)]
        var visited = Set(queue)
        
        while queue.isEmpty == false {
            let pair = queue.removeFirst()
            
            guard pair.total != targetCapacity else { return true }
            
            let states = getNewStates(from: pair, smallerJug, biggerJug)
            
            if let _ = states.first(where: { $0.reach(targetCapacity) } ) { return true }
            
            states.filter( { visited.contains($0) == false } ).forEach {
                visited.insert($0)
                queue.append($0)
            }
        }
        
        return false
        
    }
    
    private func getNewStates(from pair: Pair, _ smallerJug: Int, _ biggerJug: Int) -> [Pair] {
        return [
            Pair(left: smallerJug, right: pair.right),
            Pair(left: pair.left, right: biggerJug),
            Pair(left: 0, right: pair.right),
            Pair(left: pair.left, right: 0),
            Pair(left: min(smallerJug, pair.total), right: max(pair.total - smallerJug, 0)),
            Pair(left: max(pair.total - biggerJug, 0), right: min(biggerJug, pair.total))
        ]
    }
    
    private struct Pair: Hashable {
        var left: Int
        var right: Int
        
        var total: Int { left + right }
        
        func reach(_ target: Int) -> Bool {
            return left == target || right == target || total == target
        }
    }

}
