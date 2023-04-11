//
//  CloneGraph.swift
//  https://leetcode.com/problems/clone-graph/
//
//  Created by Erik Radicheski da Silva on 08/04/23.
//

import XCTest

private typealias Node = GenericNode<Int>

final class CloneGraph: XCTestCase {

    //TODO: Test cases

}

private class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        
        var adj = [Int: [Int]]()
        
        var queue = [node]
        var visited = Set<Int>()
        
        while queue.isEmpty == false {
            let nextNode = queue.removeFirst()
            
            guard visited.contains(nextNode.val) == false else { continue }
            visited.insert(nextNode.val)
            
            adj[nextNode.val] = []
            
            for child in nextNode.neighbors {
                guard let child = child else { continue }
                adj[nextNode.val]!.append(child.val)
                
                queue.append(child)
            }
        }
        
        let newNodes = adj.keys.sorted().map { Node($0) }
        
        for (root, neighbors) in adj {
            newNodes[root - 1].neighbors = neighbors.map { newNodes[$0 - 1] }
        }
        
        return newNodes.first
    }
}
