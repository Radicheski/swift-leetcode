//
//  LRUCache.swift
//  https://leetcode.com/problems/lru-cache/
//
//  Created by Erik Radicheski da Silva on 18/07/23.
//

import XCTest

final class LRUCacheTest: XCTestCase {

    func test() {
        let cache = LRUCache(2)
        cache.put(1, 1)
        cache.put(2, 2)
        XCTAssertEqual(cache.get(1), 1)
        cache.put(3, 3)
        XCTAssertEqual(cache.get(2), -1)
        cache.put(4, 4)
        XCTAssertEqual(cache.get(1), -1)
        XCTAssertEqual(cache.get(3), 3)
        XCTAssertEqual(cache.get(4), 4)
    }

}

private class LRUCache {
    
    let capacity: Int
    private var elements = [Int: Node]()
    private var mostRecent: Node?
    private var leastRecent: Node?
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = elements[key] else { return -1 }
        
        setMostRecent(to: node)
        
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let existing = elements[key] {
            existing.value = value
            setMostRecent(to: existing)
            return
        }
        
        if elements.count < capacity {
            let node = Node(value, for: key)
            elements[key] = node
            if let mostRecent = self.mostRecent {
                mostRecent.next = node
                node.previous = mostRecent
                self.mostRecent = node
            }
            self.mostRecent = node
            if leastRecent == nil {
                leastRecent = node
            }
        } else if let leastRecent = self.leastRecent {
            elements[leastRecent.key] = nil
            leastRecent.key = key
            leastRecent.value = value
            elements[key] = leastRecent
            setMostRecent(to: leastRecent)
        }
    }
    
    private func setMostRecent(to node: Node) {
        if let next = node.next {
            node.next = nil
            next.previous = nil
            
            if let previous = node.previous {
                node.previous = nil
                previous.next = next
                next.previous = previous
            }
            else if self.leastRecent === node {
                self.leastRecent = next
            }
            
            if let mostRecent = self.mostRecent {
                node.previous = mostRecent
                mostRecent.next = node
            }
            
            mostRecent = node
        }
    }
    
}

fileprivate class Node {
    var key: Int
    var value: Int
    
    var next: Node?
    var previous: Node?
    
    init(_ value: Int, for key: Int) {
        self.key = key
        self.value = value
    }
}
