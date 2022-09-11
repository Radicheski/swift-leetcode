//
//  TreeNode
//

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension TreeNode {
    
    /// [Source](https://leetcode.com/problems/recover-binary-search-tree/discuss/32539/Tree-Deserializer-and-Visualizer-for-Python)
    static public func parseTree(from array: [Int?]) -> TreeNode? {
        if array.isEmpty { return nil }
        
        let nodes = array.map { (value) -> TreeNode? in
            if let value = value {
                return TreeNode(value)
            } else {
                return nil
            }
        }
        
        var kids: [TreeNode?] = nodes.reversed()
        let head = kids.removeLast()
        
        for node in nodes {
            if node != nil {
                if !kids.isEmpty { node?.left = kids.removeLast() }
                if !kids.isEmpty { node?.right = kids.removeLast() }
            }
        }
        
        return head
    }

}
