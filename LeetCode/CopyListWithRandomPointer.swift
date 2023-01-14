//
//  CopyListWithRandomPointer.swift
//  https://leetcode.com/problems/copy-list-with-random-pointer/
//
//  Created by Erik Radicheski da Silva on 14/01/23.
//

import XCTest

final class CopyListWithRandomPointer: XCTestCase {

    // TODO: Test cases

}

private class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        
        var originalList = [head]
        var newList = [Node]()
        
        while originalList.count != newList.count {
            let originalNode = originalList.last!
            
            var newNode = Node(originalNode.val)
            newList.last?.next = newNode
            
            newList.append(newNode)
            if let next = originalNode.next {
                originalList.append(next)
            }
        }
        
        for (index, node) in originalList.enumerated() {
            guard node.random != nil else { continue }
            
            if let pointer = originalList.firstIndex(where: { $0 === node.random } ) {
                newList[index].random = newList[pointer]
            }
        }
        
        return newList.first
    }
}
