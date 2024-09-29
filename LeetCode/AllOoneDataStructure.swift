//
//  AllOoneDataStructure.swift
//  https://leetcode.com/problems/all-oone-data-structure/
//
//  Created by Erik Radicheski da Silva on 29/09/24.
//

import XCTest

final class AllOoneDataStructure: XCTestCase {
}

private class AllOne {
    private let head: Node
    private let tail: Node
    
    private var map = [String: Node]()

    init() {
        let head = Node(0)
        let tail = Node(.max)
        head.next = tail
        tail.previous = head
        self.head = head
        self.tail = tail
    }
    
    func inc(_ key: String) {
        if let node = map[key] {
            node.keys.remove(key)
            
            let nextNode = node.next
            if nextNode === tail || nextNode?.frequency != node.frequency + 1 {
                let newNode = Node(node.frequency + 1)
                newNode.keys.insert(key)
                newNode.previous = node
                newNode.next = nextNode
                node.next = newNode
                nextNode?.previous = newNode
                map[key] = newNode
            } else {
                nextNode?.keys.insert(key)
                map[key] = nextNode
            }
            
            if node.keys.isEmpty {
                remove(node)
            }
        } else {
            let firstNode = head.next
            if firstNode === tail || firstNode!.frequency > 1 {
                let newNode = Node(1)
                newNode.keys.insert(key)
                newNode.previous = head
                newNode.next = firstNode
                head.next = newNode
                firstNode?.previous = newNode
                map[key] = newNode
            } else {
                firstNode?.keys.insert(key)
                map[key] = firstNode
            }
        }
    }
    
    func dec(_ key: String) {
        guard let node = map[key] else { return }
        
        node.keys.remove(key)
        if node.frequency == 1 {
            map[key] = nil
        } else {
            let previous = node.previous
            if previous === head || previous?.frequency != node.frequency - 1 {
                let newNode = Node(node.frequency - 1)
                newNode.keys.insert(key)
                newNode.previous = previous
                newNode.next = node
                previous?.next = newNode
                node.previous = newNode
                map[key] = newNode
            } else {
                previous?.keys.insert(key)
                map[key] = previous
            }
        }
        
        if node.keys.isEmpty {
            remove(node)
        }
    }
    
    func getMaxKey() -> String {
        if tail.previous === head { return "" }
        return tail.previous?.keys.first ?? ""
    }
    
    func getMinKey() -> String {
        if head.next === tail { return "" }
        return head.next?.keys.first ?? ""
    }
    
    private func remove(_ node: Node) {
        let previous = node.previous
        let next = node.next
        previous?.next = next
        next?.previous = previous
    }
}

private class Node {
    var frequency: Int
    var next: Node?
    var previous: Node?
    var keys = Set<String>()
    
    init(_ frequency: Int = 0) {
        self.frequency = frequency
    }
}
