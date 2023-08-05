//
//  UniqueBinarySearchTrees2.swift
//  https://leetcode.com/problems/unique-binary-search-trees-ii/
//
//  Created by Erik Radicheski da Silva on 05/08/23.
//

import XCTest

final class UniqueBinarySearchTrees2: XCTestCase {

    // TODO: Test cases

}

private class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        var dp = Array(repeating: [[TreeNode?]](), count: n + 1)
        
        for i in dp.indices {
            dp[i] = Array(repeating: [TreeNode?](), count: n + 1)
        }
        
        for i in 1 ... n {
            dp[i][i].append(TreeNode(i))
        }
        
        guard n > 1 else { return dp[1][n] }
        
        for nodes in 2 ... n {
            for start in 1 ... n - nodes + 1 {
                
                let end = start + nodes  - 1
                
                for i in start ... end {
                    var leftSubtrees = i != start ? dp[start][i - 1] : []
                    
                    if leftSubtrees.isEmpty {
                        leftSubtrees.append(nil)
                    }
                    
                    var rightSubtrees = i != end ? dp[i + 1][end] : []
                    
                    if rightSubtrees.isEmpty {
                        rightSubtrees.append(nil)
                    }
                    
                    for left in leftSubtrees {
                        for right in rightSubtrees {
                            let root = TreeNode(i, left, right)
                            dp[start][end].append(root)
                        }
                    }
                }
            }
        }
        
        return dp[1][n]
    }
}

