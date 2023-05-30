//
//  DesignHashSet.swift
//  https://leetcode.com/problems/design-hashset/
//
//  Created by Erik Radicheski da Silva on 30/05/23.
//

import XCTest

final class DesignHashSet: XCTestCase {

    //TODO: Test cases

}

private class MyHashSet {
    
    private var tree: BST?
    
    func add(_ key: Int) {
        if let tree = tree {
            tree.add(key)
        } else {
            tree = BST(key)
        }
    }
    
    func remove(_ key: Int) {
        tree = tree?.remove(key)
    }
    
    func contains(_ key: Int) -> Bool {
        return tree?.contains(key) ?? false
    }
    
    private class BST {
        private var val: Int
        private var left: BST?
        private var right: BST?
        
        init(_ val: Int) {
            self.val = val
        }
        
        private init?( _ vals: [Int]) {
            guard vals.isEmpty == false else { return nil }
            let middle = vals.endIndex / 2
            val = vals[middle]
            left = BST(Array(vals[..<middle]))
            right = BST(Array(vals[(middle + 1)...]))
        }
        
        func add(_ key: Int) {
            if key < val {
                if let left = left {
                    left.add(key)
                } else {
                    left = BST(key)
                }
            } else if key > val {
                if let right = right {
                    right.add(key)
                } else {
                    right = BST(key)
                }
            } else {
                return
            }
        }
        
        func contains(_ key: Int) -> Bool {
            if key < val {
                return left?.contains(key) ?? false
            } else if key > val {
                return right?.contains(key) ?? false
            } else {
                return true
            }
        }
        
        func remove(_ key: Int) -> BST? {
            if key < val {
                left = left?.remove(key)
            } else if key > val {
                right = right?.remove(key)
            } else {
                let vals = (left?.inOrder() ?? []) + (right?.inOrder() ?? [])
                return BST(vals)
            }
            
            return self
        }
        
        private func inOrder() -> [Int] {
            return (left?.inOrder() ?? []) + [val] + (right?.inOrder() ?? [])
        }
    }
}
