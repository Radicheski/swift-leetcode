//
//  BinarySearchTreeIterator.swift
//  https://leetcode.com/problems/binary-search-tree-iterator/
//
//  Created by Erik Radicheski da Silva on 14/10/22.
//

import XCTest

final class BinarySearchTreeIterator: XCTestCase {
    
    private var iterator: BSTIterator!
    
    func testExampleA() {
        let commands = ["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
        let inputs = [[[7, 3, 15, nil, nil, 9, 20]], [], [], [], [], [], [], [], [], []]
        let outputs: [Any?] = [nil, 3, 7, true, 9, true, 15, true, 20, false]
        execute(commands, with: inputs, resultingIn: outputs)
    }
    
    func execute(_ commands: [String], with inputs: [[[Int?]]], resultingIn outputs: [Any?]) {
        assert(commands.count == inputs.count)
        assert(inputs.count == outputs.count)
        
        for (index, command) in commands.enumerated() {
            
            switch command {
                
            case "BSTIterator":
                createInstances(inputs[index])
                
            case "next":
                XCTAssertEqual(iterator.next(), outputs[index] as! Int)
                
            case "hasNext":
                XCTAssertEqual(iterator.hasNext(), outputs[index] as! Bool)
                
            default:
                XCTFail("Command \"\(command)\" not recognized.")
            }
        }
    }
    
    func createInstances(_ values: [[Int?]]) {
        let root = TreeNode.parseTree(from: values[0])
        iterator = BSTIterator(root)
    }
    
}

private class BSTIterator {
    
    private var index = 0
    private let array: [Int]
    
    init(_ root: TreeNode?) {
        array = Self.inorder(root)
    }
    
    func next() -> Int {
        index += 1
        return array[index - 1]
    }
    
    func hasNext() -> Bool {
        return index < array.count
    }
    
    private static func inorder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        let left = inorder(root.left)
        let right = inorder(root.right)
        
        var result = [Int]()
        result.append(contentsOf: left)
        result.append(root.val)
        result.append(contentsOf: right)
        
        return result
    }
    
}
