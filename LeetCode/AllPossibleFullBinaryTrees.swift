//
//  AllPossibleFullBinaryTrees.swift
//  https://leetcode.com/problems/all-possible-full-binary-trees/
//
//  Created by Erik Radicheski da Silva on 23/07/23.
//

import XCTest

final class AllPossibleFullBinaryTrees: XCTestCase {

    //TODO: Test cases

}

private class Solution {
    func allPossibleFBT(_ n: Int) -> [TreeNode?] {
        var dp = [Int: [TreeNode?]]()
        return allPossibleFBT(n, &dp)
    }

    private func allPossibleFBT(_ n: Int, _ dp: inout [Int: [TreeNode?]]) -> [TreeNode?] {
        guard n.isMultiple(of: 2) == false else { return [] }
        guard n != 1 else { return [TreeNode(0)] }
        
        if let answer = dp[n] {
            return answer
        }
        
        var answer = [TreeNode?]()
        
        for i in stride(from: 1, to: n, by: 2) {
            let left = allPossibleFBT(i, &dp)
            let right = allPossibleFBT(n - i - 1, &dp)
            
            for l in left {
                for r in right {
                    let root = TreeNode(0, l, r)
                    answer.append(root)
                }
            }
        }
        
        dp[n] = answer
        
        return answer
    }
}
