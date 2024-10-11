//
//  TheNumberOfTheSmallestUnoccupiedChair.swift
//  https://leetcode.com/problems/the-number-of-the-smallest-unoccupied-chair/
//
//  Created by Erik Radicheski da Silva on 11/10/24.
//

import XCTest

final class TheNumberOfTheSmallestUnoccupiedChair: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.smallestChair([[1, 4], [2, 3], [4, 6]], 1), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.smallestChair([[3, 10], [1, 5], [2,6]], 0), 2)
    }
    
}

private class Solution {
    func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
        let targetArrival = times[targetFriend][0]
        let times = times.sorted { $0[0] < $1[0] }
        
        var nextChair = 0
        var leavingQueue = [[Int]]()
        var availableChairs = Set<Int>()
        
        for time in times {
            let (arrival, leave) = (time[0], time[1])
            
            while let first = leavingQueue.first, first[0] <= arrival {
                availableChairs.insert(first[1])
                let _ = leavingQueue.removeFirst()
            }
            
            var currentChair = -1
            
            if let first = availableChairs.min() {
                currentChair = first
                availableChairs.remove(first)
            } else {
                currentChair = nextChair
                nextChair += 1
            }
            
            leavingQueue.append([leave, currentChair])
            leavingQueue.sort { $0[0] < $1[0] }
            
            if arrival == targetArrival { return currentChair }
        }
        
        return -1
    }
}
