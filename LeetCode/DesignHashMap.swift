//
//  DesignHashMap.swift
//  https://leetcode.com/problems/design-hashmap/
//
//  Created by Erik Radicheski da Silva on 29/09/22.
//

import XCTest

final class DesignHashMap: XCTestCase {

}

private class MyHashMap {
    
    private var array = Array(repeating: [Node](), count: 16)
    
    init() {
        
    }
    
    func put(_ key: Int, _ value: Int) {
        let index = getIndex(for: key)
        if let nodeIndex = array[index].firstIndex(where: { $0.key == key }) {
            array[index][nodeIndex] = Node(key: key, value: value)
        } else {
            array[index].append(Node(key: key, value: value))
        }
    }
    
    func get(_ key: Int) -> Int {
        let index = getIndex(for: key)
        if var node = array[index].first(where: { $0.key == key } ) {
            return node.value
        } else {
            return -1
        }
    }
    
    func remove(_ key: Int) {
        let index = getIndex(for: key)
        array[index].removeAll { $0.key == key }
    }
    
    private func getIndex(for key: Int) -> Int {
        key.hashValue & 15
    }
    
    private struct Node: Hashable, Equatable {
        var key: Int
        var value: Int
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(key)
        }
        
        static func ==(lhs: Node, rhs: Node) -> Bool {
            return lhs.key == rhs.key
        }
        
    }
    
}
