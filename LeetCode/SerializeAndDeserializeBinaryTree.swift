//
//  SerializeAndDeserializeBinaryTree.swift
//  https://leetcode.com/problems/serialize-and-deserialize-binary-tree/
//
//  Created by Erik Radicheski da Silva on 15/10/22.
//

import XCTest

final class SerializeAndDeserializeBinaryTree: XCTestCase {

    private let coder = Codec()
    
    func testExampleA() {
        let input = TreeNode.parseTree(from: [1, 2, 3, nil, nil, 4, 5])
        let string = coder.serialize(input)
        let output = coder.deserialize(string)
        XCTAssertTrue(TreeNode.isEqual(input, output))
    }
    
    func testExampleB() {
        let input = TreeNode.parseTree(from: [])
        let string = coder.serialize(input)
        let output = coder.deserialize(string)
        XCTAssertTrue(TreeNode.isEqual(input, output))
    }

}

private class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
    
        let left = serialize(root.left)
        let right = serialize(root.right)
        
        return "[\(left)],\(root.val),[\(right)]"
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        guard data.isEmpty == false else { return nil }
        let characters = Array(data)
        var braces = [Character]()
        
        var value = [Character]()
        
        var splitIndexes = [Int]()
        
        for (index, character) in characters.enumerated() {
            if character == "[" {
                braces.append(character)
                continue
            }
            
            if character == "]" {
                assert(braces.isEmpty == false)
                braces.removeLast()
                continue
            }
            
            if braces.isEmpty == false { continue }
            
            if character == "," {
                splitIndexes.append(index)
                continue
            }
            
            if character != "," {
                value.append(character)
                continue
            }
            
        }
        
        let left = deserialize(String(characters[1 ..< splitIndexes[0] - 1]))
        let right = deserialize(String((characters[splitIndexes[1] + 2 ..< characters.count - 1])))
        let selfValue = Int(String(value))!
        
        return TreeNode(selfValue, left, right)
    }
}
