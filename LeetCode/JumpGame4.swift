//
//  JumpGame4.swift
//  https://leetcode.com/problems/jump-game-iv/
//
//  Created by Erik Radicheski da Silva on 05/03/23.
//

import XCTest

final class JumpGame4: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minJumps([100, -23, -23, 404, 100, 23, 23, 23, 3, 404]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minJumps([7]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minJumps([7, 6, 9, 6, 9, 6, 9, 7]), 1)
    }

}

private class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        var indexDict = [Int: [Int]]()
        
        for (index, value) in arr.enumerated() {
            indexDict[value, default: []].append(index)
        }

        var queue = [(index: Int, steps: Int)]()
        queue.append((index: 0, steps: 0))
        
        var visited = Set<Int>()
        visited.insert(0)

        while !queue.isEmpty {
            let tempQueue = queue
            queue.removeAll()

            for element in tempQueue {
                if element.index == arr.count - 1 {
                    return element.steps
                }
                
                let currentIndex = element.index
                var nextIndexes: [Int] = []
                nextIndexes += currentIndex + 1 < arr.count ? [currentIndex + 1] : []
                nextIndexes += currentIndex - 1 >= 0 ? [currentIndex - 1] : []
                nextIndexes += indexDict[arr[currentIndex], default: []]
                
                indexDict[arr[currentIndex]] = nil
                for index in nextIndexes
                where !visited.contains(index) && (index < arr.count && index >= 0) {
                   queue.append((index: index, steps: element.steps + 1))
                   visited.insert(index)
                }
            }
        }
        return -1
    }
}
