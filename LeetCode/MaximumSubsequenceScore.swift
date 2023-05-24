//
//  MaximumSubsequenceScore.swift
//  https://leetcode.com/problems/maximum-subsequence-score/
//
//  Created by Erik Radicheski da Silva on 24/05/23.
//

import XCTest

final class MaximumSubsequenceScore: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxScore([1, 3, 3, 2], [2, 1, 3, 4], 3), 12)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxScore([4, 2, 3, 1, 1], [7, 5, 10, 9, 6], 1), 30)
    }
    

}

private class Solution {
    func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        var pairs = Array(repeating: [Int](), count: nums1.count)
        for i in nums1.indices {
            pairs[i] = [nums1[i], nums2[i]]
        }
        pairs.sort { $0[1] > $1[1] }
        
        var heap = PriorityQueue<Int>(sort: { $0 < $1 } )
        var sum = 0
        
        for i in 0 ..< k {
            sum += pairs[i][0]
            heap.enqueue(pairs[i][0])
        }
        
        var answer = sum * pairs[k - 1][1]
        
        for i in k ..< nums1.endIndex {
            sum += pairs[i][0] - heap.dequeue()!
            heap.enqueue(pairs[i][0])
            answer = max(answer, sum * pairs[i][1])
        }
        
        return answer
    }
}

// From https://github.com/kodecocodes/swift-algorithm-club/blob/2fdd8b8be1b3fcd17ad0394053e672f2bd1d3076/Priority%20Queue/PriorityQueue.swift

/*
  Priority Queue, a queue where the most "important" items are at the front of
  the queue.

  The heap is a natural data structure for a priority queue, so this object
  simply wraps the Heap struct.

  All operations are O(lg n).

  Just like a heap can be a max-heap or min-heap, the queue can be a max-priority
  queue (largest element first) or a min-priority queue (smallest element first).
*/
public struct PriorityQueue<T> {
  fileprivate var heap: Heap<T>

  /*
    To create a max-priority queue, supply a > sort function. For a min-priority
    queue, use <.
  */
  public init(sort: @escaping (T, T) -> Bool) {
    heap = Heap(sort: sort)
  }

  public var isEmpty: Bool {
    return heap.isEmpty
  }

  public var count: Int {
    return heap.count
  }

  public func peek() -> T? {
    return heap.peek()
  }

  public mutating func enqueue(_ element: T) {
    heap.insert(element)
  }

  public mutating func dequeue() -> T? {
    return heap.remove()
  }

  /*
    Allows you to change the priority of an element. In a max-priority queue,
    the new priority should be larger than the old one; in a min-priority queue
    it should be smaller.
  */
  public mutating func changePriority(index i: Int, value: T) {
    return heap.replace(index: i, value: value)
  }
}

extension PriorityQueue where T: Equatable {
  public func index(of element: T) -> Int? {
    return heap.index(of: element)
  }
}
