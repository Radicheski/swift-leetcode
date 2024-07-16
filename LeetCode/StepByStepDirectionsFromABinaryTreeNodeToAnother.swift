//
//  StepByStepDirectionsFromABinaryTreeNodeToAnother.swift
//  https://leetcode.com/problems/step-by-step-directions-from-a-binary-tree-node-to-another/
//
//  Created by Erik Radicheski da Silva on 16/07/24.
//

import XCTest

final class StepByStepDirectionsFromABinaryTreeNodeToAnother: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [5, 1, 2, 3, nil, 6, 4])
        XCTAssertEqual(solution.getDirections(root, 3, 6), "UURL")
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [2, 1])
        XCTAssertEqual(solution.getDirections(root, 2, 1), "L")
    }
    
}

private class Solution {
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        var parentMap = [Int: TreeNode]()
        
        let startNode = findStartNode(root, startValue)
        populateMap(root, &parentMap)
        
        var queue = [startNode!]
        var visited = Set<Int>()
        
        var path = [Int: (parent: TreeNode, path: [Character])]()
        visited.insert(startNode!.val)
        
        while let currentNode = queue.popLast() {
            if currentNode.val == destValue {
                return backtrack(currentNode, path)
            }
            
            if let parentNode = parentMap[currentNode.val] {
                if visited.insert(parentNode.val).inserted {
                    queue.append(parentNode)
                    path[parentNode.val] = (currentNode, ["U"])
                }
            }
            
            if let left = currentNode.left, visited.insert(left.val).inserted {
                queue.append(left)
                path[left.val] = (currentNode, ["L"])
            }
            
            if let right = currentNode.right, visited.insert(right.val).inserted {
                queue.append(right)
                path[right.val] = (currentNode, ["R"])
            }
        }
        
        return ""
    }
    
    private func backtrack(_ node: TreeNode?,
                           _ tracker: [Int: (parent: TreeNode, path: [Character])]) -> String {
        var path = [Character]()
        var node = node!.val
        
        while let (parent, oldPath) = tracker[node] {
            path.append(contentsOf: oldPath)
            node = parent.val
        }
        
        return String(path.reversed())
    }
    
    private func populateMap(_ node: TreeNode?, _ map: inout [Int: TreeNode]) {
        guard let node = node else { return }
        
        if let left = node.left {
            map[left.val] = node
            populateMap(left, &map)
        }
        
        if let right = node.right {
            map[right.val] = node
            populateMap(right, &map)
        }
    }
    
    private func findStartNode(_ node: TreeNode?, _ startValue: Int) -> TreeNode? {
        guard let node = node else { return nil }
        
        if node.val == startValue { return node }
        
        if let left = findStartNode(node.left, startValue) {
            return left
        } else {
            return findStartNode(node.right, startValue)
        }
    }
 }
