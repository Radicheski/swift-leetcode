//
//  FindKPairsWithSmallestSums.swift
//  https://leetcode.com/problems/find-k-pairs-with-smallest-sums/
//
//  Created by Erik Radicheski da Silva on 27/06/23.
//

import XCTest

final class FindKPairsWithSmallestSums: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.kSmallestPairs([1, 7, 11], [2, 4, 6], 3), [[1, 2], [1, 4], [1, 6]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.kSmallestPairs([1, 1, 2], [1, 2, 3], 2), [[1, 1], [1, 1]])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.kSmallestPairs([1, 2], [3], 3), [[1, 3], [2, 3]])
    }
    
}

private class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var queue = Queue()
        queue.push(nums1[0] + nums2[0], 0, 0)
        
        var answer = [[Int]]()
        
        while answer.count < k && queue.isEmpty == false {
            let triplet = queue.pop()
            
            let i = triplet[1]
            let j = triplet[2]
            
            answer.append([nums1[i], nums2[j]])
            
            if nums1.indices.contains(i + 1) {
                queue.push(nums1[i + 1] + nums2[j], i + 1, j)
            }
            
            if nums2.indices.contains(j + 1) {
                queue.push(nums1[i] + nums2[j + 1], i, j + 1)
            }
        }
        
        return answer
    }
    
    private struct Queue {
        private(set) var queue = [[Int]]()
        var isEmpty: Bool { queue.isEmpty }
        
        private var visited = Set<[Int]>()
        
        mutating func push(_ sum: Int, _ index1: Int, _ index2: Int) {
            guard visited.contains([index1, index2]) == false else {
                return
            }
            
            visited.insert([index1, index2])
            
            guard queue.isEmpty == false else {
                queue.append([sum, index1, index2])
                return
            }
            
            guard queue.first![0] < sum else {
                queue.insert([sum, index1, index2], at: 0)
                return
            }
            
            guard queue.last![0] > sum else {
                queue.append([sum, index1, index2])
                return
            }
            
            var left = 0
            var right = queue.endIndex - 1
            
            while left < right {
                let middle = left + (right - left) / 2
                
                if queue[middle][0] < sum {
                    left = middle + 1
                } else {
                    right = middle
                }
            }
            
            queue.insert([sum, index1, index2], at: left)
        }
        
        mutating func pop() -> [Int] {
            return queue.removeFirst()
        }
    }
}
