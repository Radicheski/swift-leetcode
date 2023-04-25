//
//  SmallestNumberInInfiniteSet.swift
//  https://leetcode.com/problems/smallest-number-in-infinite-set/
//
//  Created by Erik Radicheski da Silva on 25/04/23.
//

import XCTest

final class SmallestNumberInInfiniteSet: XCTestCase {

    func testExampleA() {
        let set = SmallestInfiniteSet()
        set.addBack(2)
        XCTAssertEqual(set.popSmallest(), 1)
        XCTAssertEqual(set.popSmallest(), 2)
        XCTAssertEqual(set.popSmallest(), 3)
        set.addBack(1)
        XCTAssertEqual(set.popSmallest(), 1)
        XCTAssertEqual(set.popSmallest(), 4)
        XCTAssertEqual(set.popSmallest(), 5)
    }

}

private class SmallestInfiniteSet {
    
    private var minHeap = MinHeap<Int>()
    private var present = Set<Int>()
    private var next = 1
    
    func popSmallest() -> Int {
        if let smallest = minHeap.popMin() {
            present.remove(smallest)
            return smallest
        }
        
        let next = self.next
        self.next += 1
        return next
    }
    
    func addBack(_ num: Int) {
        guard num < next else { return }
        guard present.contains(num) == false else { return }
        
        minHeap.insert(num)
        present.insert(num)
    }
}

private class MinHeap<T: Comparable> {
    private var heap: [T] = []
    
    var isEmpty: Bool { heap.isEmpty }
    
    func insert(_ value: T) {
        self.heap.append(value)
        var currentIndex = self.heap.count - 1
        var parentIndex = self.getParentIndex(currentIndex)
        while currentIndex > 0 && self.heap[currentIndex] < self.heap[parentIndex] {
            swap(currentIndex, parentIndex)
            currentIndex = parentIndex
            parentIndex = self.getParentIndex(currentIndex)
        }
    }
    
    private func getParentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func swap(_ index1: Int, _ index2: Int) {
        (self.heap[index1], self.heap[index2]) = (self.heap[index2], self.heap[index1])
    }
    
    func popMin() -> T? {
        guard heap.isEmpty == false else { return nil }
        
        let min = heap[0]
        let last = heap.removeLast()
        if heap.isEmpty == false {
            heap[0] = last
            var currentIndex = 0
            var leftChildIndex = getLeftChildIndex(currentIndex)
            var rightChildIndex = getRightChildIndex(currentIndex)
            while leftChildIndex < heap.count &&
                  (heap[leftChildIndex] < heap[currentIndex] ||
                   (rightChildIndex < heap.count && heap[rightChildIndex] < heap[currentIndex])) {
                let smallerChildIndex = rightChildIndex < heap.count &&
                      heap[rightChildIndex] < heap[leftChildIndex] ? rightChildIndex : leftChildIndex

                swap(currentIndex, smallerChildIndex)
                currentIndex = smallerChildIndex
                leftChildIndex = getLeftChildIndex(currentIndex)
                rightChildIndex = getRightChildIndex(currentIndex)
            }
        }
        return min
    }
    
    private func getLeftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func getRightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }
    
}
