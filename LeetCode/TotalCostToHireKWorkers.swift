//
//  TotalCostToHireKWorkers.swift
//  https://leetcode.com/problems/total-cost-to-hire-k-workers/
//
//  Created by Erik Radicheski da Silva on 26/06/23.
//

import XCTest

final class TotalCostToHireKWorkers: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.totalCost([17, 12, 10, 2, 7, 2, 11, 20, 8], 3, 4), 11)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.totalCost([1, 2, 4, 1], 3, 3), 4)
    }

}

private class Solution {
    func totalCost(_ costs: [Int], _ k: Int, _ candidates: Int) -> Int {
        var leftCandidates = Queue()
        var leftIndex = 0
        
        var rightCandidates = Queue()
        var rightIndex = costs.endIndex - 1
        
        for _ in 0 ..< candidates {
            guard leftIndex < rightIndex else {
                if leftIndex == rightIndex {
                    leftCandidates.insert(cost: costs[leftIndex])
                    leftIndex += 1
                }
                break
            }
            
            leftCandidates.insert(cost: costs[leftIndex])
            leftIndex += 1
            
            rightCandidates.insert(cost: costs[rightIndex])
            rightIndex -= 1
        }
        
        var totalCost = 0
        
        for _ in 0 ..< k {
            let leftMin = leftCandidates.peekHead() ?? Int.max
            let rightMin = rightCandidates.peekHead() ?? Int.max
            
            guard leftMin < .max || rightMin < .max else { break }
            
            if rightMin < leftMin {
                totalCost += rightMin
                rightCandidates.removeHead()
                
                if leftIndex <= rightIndex {
                    rightCandidates.insert(cost: costs[rightIndex])
                    rightIndex -= 1
                }
            } else {
                totalCost += leftMin
                leftCandidates.removeHead()
                
                if leftIndex <= rightIndex {
                    leftCandidates.insert(cost: costs[leftIndex])
                    leftIndex += 1
                }
            }
        }
        
        return totalCost
    }
    
    private struct Queue {
        
        private var queue = [Int]()
        
        mutating func insert(cost: Int) {
            guard queue.isEmpty == false else {
                queue.append(cost)
                return
            }
            
            guard queue.last! > cost else {
                queue.append(cost)
                return
            }
            
            guard queue.first! < cost else {
                queue.insert(cost, at: 0)
                return
            }
            
            var left = 0
            var right = queue.endIndex - 1
            
            while left < right {
                let middle = left + (right - left) / 2
                if cost < queue[middle] {
                    right = middle
                } else {
                    left = middle + 1
                }
            }
            
            queue.insert(cost, at: left)
        }
        
        func peekHead() -> Int? {
            return queue.first
        }
        
        mutating func removeHead() {
            let _ = queue.removeFirst()
        }
        
    }
}
