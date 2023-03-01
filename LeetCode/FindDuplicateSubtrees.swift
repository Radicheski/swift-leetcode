//
//  FindDuplicateSubtrees.swift
//  https://leetcode.com/problems/find-duplicate-subtrees/
//
//  Created by Erik Radicheski da Silva on 28/02/23.
//

import XCTest

final class FindDuplicateSubtrees: XCTestCase {

    // MARK: Test cases

}

private class Solution {
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var result = [TreeNode]()
        
        var tripletToID = [String: Int]()
        var count = [Int: Int]()
        
        let _ = traverse(root, &tripletToID, &count, &result)
        
        return result
    }
    
    private func traverse(_ node: TreeNode?,
                          _ tripletToID: inout [String: Int],
                          _ count: inout [Int: Int],
                          _ result: inout [TreeNode]) -> Int {
        guard let node = node else { return 0 }
        
        let leftId = traverse(node.left, &tripletToID, &count, &result)
        let rightId = traverse(node.right, &tripletToID, &count, &result)
        let triplet = "\(leftId),\(node.val),\(rightId)"
        
        let id = tripletToID[triplet] ?? tripletToID.count + 1
        tripletToID[triplet] = id
        
        count[id, default: 0] += 1
        
        if count[id] == 2 {
            result.append(node)
        }
        
        return id
    }
}
