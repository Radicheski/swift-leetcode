//
//  Node.swift
//

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

extension Node {
    static func parseTree(from array: [Int?]) -> Node? {
        if array.compactMap( { $0 } ).isEmpty { return nil }
        
        var array = array
        
        var nodes = [Node]()
        var children = [Node]()
        var counter = 0
        
        while !array.isEmpty {
            if let nextValue = array.removeFirst() {
                children.append(Node(nextValue))
            } else {
                if nodes.isEmpty {
                    nodes.append(contentsOf: children)
                    children.removeAll()
                } else {
                    nodes.append(contentsOf: children)
                    nodes[counter].children = children
                    children.removeAll()
                    counter += 1
                }
            }
        }
        
        nodes[counter].children = children
        
        return nodes.first
    }
}
